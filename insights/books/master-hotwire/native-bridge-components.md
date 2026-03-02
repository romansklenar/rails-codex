---
title: "Hotwire Native: Bridge Components and Publishing"
description: "Bridge components let web Stimulus controllers drive native iOS/Android UI by passing messages across the JS↔native boundary; publishing to App Store and Play Store requires minimal Hotwire-specific configuration beyond standard mobile release steps."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://masterhotwire.com"
  date: "2026-02-01"
tags: [hotwire-native, bridge-components, ios, android, publishing, app-store]
---

# Hotwire Native: Bridge Components and Publishing

Bridge components let web Stimulus controllers drive native iOS/Android UI by passing messages across the JS↔native boundary; publishing to App Store and Play Store requires minimal Hotwire-specific configuration beyond standard mobile release steps.

## What Bridge Components Are

- A bridge component has two sides: a **bridge controller** (web/JS, inherits from `BridgeComponent` which itself inherits from a Stimulus `Controller`) and a **bridge component** (native Swift or Kotlin, inherits from a `BridgeComponent` base class provided by `HotwireNative`).
- Naming convention: "controller" = web side; "component" = native side — the two are paired by a shared string name (e.g. `"submit-button"`).
- The web side stays in control of content and functionality; the native side handles platform-specific UI rendering details.
- Bridge components are reusable — once built, they can be attached wherever the `data-controller` attribute appears, across all pages using the same partial.
- The `BridgeComponent` JS base class checks the User-Agent string; it only attaches the Stimulus controller when the native app advertises support for that specific component name, so the web UI is automatically used as a fallback for older app versions.
- The User-Agent injected by Hotwire Native contains the platform and registered components, e.g.: `Hotwire Native Android; Turbo Native Android; bridge-components: [submit-button]; Mozilla/5.0 ...`

## Installing the JS Bridge Library

- Install via importmap-rails: `./bin/importmap pin @hotwired/stimulus @hotwired/hotwire-native-bridge` — this vendors both libraries into `vendor/javascript` and adds entries to `config/importmap.rb`.
- The `@hotwired/hotwire-native-bridge` library integrates with Stimulus to build web-side bridge controllers.

## Defining the Web Side (JS Bridge Controller)

- Generate the controller: `./bin/rails generate stimulus bridge/submit_button` — place bridge controllers in a `bridge/` subfolder to logically separate them from regular Stimulus controllers (they only activate inside the native app).
- Minimal controller definition:
  ```js
  // app/javascript/controllers/bridge/submit_button_controller.js
  import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

  export default class extends BridgeComponent {
    static component = "submit-button"
  }
  ```
- The `static component` string is the pairing key — it must exactly match `name` on the native side.
- Attach to an HTML element with `data-controller="bridge--submit-button"` (Rails Stimulus double-dash convention for nested paths).

## Message Passing Protocol

- The controller calls `this.send(event, data = {}, callback)` to push a message to the native component:
  - `event` — a string identifier, often matching the JS lifecycle method name (e.g. `"connect"`, `"disconnect"`).
  - `data` — arbitrary JSON payload sent to the native side (e.g. `{ title: "Create Ticket" }`).
  - `callback` — function invoked when the native component replies; implement the web-side reaction here (e.g. simulate a click).
- Full connect/disconnect example:
  ```js
  connect() {
    this.send("connect", { title: this.bridgeElement.title }, () => {
      this.bridgeElement.click()
    })
  }

  disconnect() {
    this.send("disconnect")
  }
  ```
- `this.bridgeElement` returns a `BridgeElement` instance; key methods:
  - `.title` — looks in `data-bridge-title`, then `aria-label`, then `textContent`/`value` in order.
  - `.click()` — simulates a click with platform-specific corner-case handling; prefer this over `this.element.click()`.

## How the Bridge Works Internally

- The `hotwire-native-bridge` library initialises a global `window.HotwireNative` object with a `web` property holding a `Bridge` class instance.
- The native side injects a JS file (`bridge.js` on iOS, `bridge_components.js` on Android) that registers a low-level adapter with `window.HotwireNative`.
- `send()` flow: controller packages message → bridge assigns a unique ID → stores optional callback in `#pendingCallbacks[id]` → forwards message to native via platform mechanism → native stores ID → on reply, adapter calls `receive()` on the bridge → bridge looks up callback by ID and invokes it.
- `BridgeComponent.shouldLoad` (static Stimulus hook) reads the User-Agent to verify the component name is advertised; returns `false` in a plain browser or on app versions that don't support this component.
- Booting order is non-deterministic: native JS injection runs first and waits for the `web-bridge:ready` event emitted by the bridge library's `start()` call; messages sent before the adapter registers are queued and flushed once the adapter attaches.
- The entire bridge implementation is ~300 lines of JS; nearly all logic lives in JS, making issues debuggable without Swift/Kotlin knowledge.

## Implementing the Native iOS Component (Swift)

- Create a `Components/` subfolder in the Xcode project; add an empty `SubmitButtonComponent.swift` file.
- Minimal component:
  ```swift
  // ios/Hotboard/Hotboard/Components/SubmitButtonComponent.swift
  import HotwireNative
  import UIKit

  final class SubmitButtonComponent: BridgeComponent {
      override class var name: String { "submit-button" }

      override func onReceive(message: Message) {
          guard let viewController else { return }
          guard let data: MessageData = message.data() else { return }
          addButton(using: data, to: viewController)
      }

      private var viewController: UIViewController? {
          delegate?.destination as? UIViewController
      }

      private func addButton(
          using data: MessageData,
          to viewController: UIViewController
      ) {
          let action = UIAction { [unowned self] _ in
              self.reply(to: "connect")
          }
          let item = UIBarButtonItem(title: data.title, primaryAction: action)
          viewController.navigationItem.rightBarButtonItem = item
      }
  }

  private extension SubmitButtonComponent {
      struct MessageData: Decodable {
          let title: String
      }
  }
  ```
- Key points: `name` class var pairs the component with its JS controller; `onReceive(message:)` is called by Hotwire Native on every incoming message; `MessageData` is a `Decodable` struct — add fields here to extend the payload; `reply(to: "connect")` triggers the JS callback.
- Register in `AppDelegate.swift` after `loadPathConfiguration`:
  ```swift
  Hotwire.registerBridgeComponents([
      SubmitButtonComponent.self
  ])
  ```
- iOS reassigns `rightBarButtonItem` on every connect message, so duplicate buttons are not an issue — no explicit disconnect cleanup required.
- To dismiss a modal from a cancel button component: `viewController.dismiss(animated: true)`.

## Implementing the Native Android Component (Kotlin)

- Required Gradle additions to `android/app/build.gradle.kts`:
  - Plugins: `alias(libs.plugins.compose.compiler)` and `id("org.jetbrains.kotlin.plugin.serialization")`.
  - `buildFeatures { compose = true }` in the `android` block.
  - Dependencies: `platform(libs.androidx.compose.bom)`, `libs.androidx.material3`, `libs.androidx.ui.tooling.preview`, `libs.kotlinx.serialization.json`.
  - Also declare compose compiler and serialization plugins in the project-level `android/build.gradle.kts`.
- Create a `components` package under the app's main package; add `SubmitButtonComponent.kt`:
  ```kotlin
  // android/app/src/main/java/com/masterhotwire/hotboard/components/SubmitButtonComponent.kt
  class SubmitButtonComponent(
      name: String,
      private val bridgeDelegate: BridgeDelegate<HotwireDestination>
  ) : BridgeComponent<HotwireDestination>(name, bridgeDelegate) {

      private val buttonId = 1

      private val fragment: HotwireFragment
          get() = bridgeDelegate.destination.fragment as HotwireFragment

      override fun onReceive(message: Message) {
          when (message.event) {
              "connect"    -> addButton(message)
              "disconnect" -> removeButton()
              else         -> Log.w("ButtonComponent", "Unknown event: $message")
          }
      }

      private fun addButton(message: Message) {
          val data = message.data<MessageData>() ?: return
          val button = ComposeView(fragment.requireContext()).apply {
              id = buttonId
              setContent {
                  Button(onClick = { replyTo("connect") }) {
                      Text(data.title)
                  }
              }
          }
          val layoutParams = Toolbar.LayoutParams(
              ViewGroup.LayoutParams.WRAP_CONTENT,
              ViewGroup.LayoutParams.WRAP_CONTENT
          ).apply { gravity = Gravity.END }
          fragment.toolbarForNavigation()?.addView(button, layoutParams)
      }

      private fun removeButton() {
          val toolbar = fragment.toolbarForNavigation()
          toolbar?.removeView(toolbar.findViewById<ComposeView>(buttonId))
      }

      @Serializable
      data class MessageData(@SerialName("title") val title: String)
  }
  ```
- `replyTo("connect")` (Android) is the equivalent of `reply(to: "connect")` (iOS) — triggers the JS callback.
- Android adds to a view list rather than replacing a property, so `disconnect` must call `removeButton()` to prevent duplicates when the same form is reopened.
- Use a stable integer `buttonId` on the view to retrieve it later via `toolbar.findViewById<ComposeView>(buttonId)`.
- Register in `HotboardApplication.kt` after `loadPathConfiguration`:
  ```kotlin
  Hotwire.registerBridgeComponents(
      BridgeComponentFactory("submit-button", ::SubmitButtonComponent)
  )
  Hotwire.config.jsonConverter = KotlinXJsonConverter()
  ```
- `KotlinXJsonConverter` is required for Hotwire Native to deserialise bridge message data; without it, `message.data<MessageData>()` returns null.
- To dismiss a modal: `fragment.requireActivity().onBackPressedDispatcher.onBackPressed()`.

## Hiding Web UI When Bridge Component Is Active

- CSS approach (preferred for simplicity): the bridge JS library adds `data-bridge-components` (space-separated list) and `data-bridge-platform` (`android` or `ios`) attributes to the top-level `<html>` element when native bridge components are detected.
- Hide the replaced HTML element with an attribute selector:
  ```css
  [data-bridge-components~="submit-button"]
  [data-controller~="bridge--submit-button"] {
    display: none;
  }
  ```
- For general "hide on native" elements, use the `hotwire-native` class added to `<html>` by the bridge library:
  ```css
  html.hotwire-native .hide-on-native {
    display: none;
  }
  ```
  Apply `class="hide-on-native"` to any element that should not appear inside the native app.
- Prefer a no-op bridge component over CSS `data-bridge-platform` checks for conditional hiding: it keeps logic uniform, degrades gracefully on older app versions (no native component advertised → web UI shown), and avoids platform-specific special cases.
- The CSS approach cannot handle older app versions that don't advertise the component; the bridge controller approach handles this automatically.

## Publishing to iOS App Store

- **Developer Program**: enroll at `developer.apple.com/programs/enroll/` — costs US$99/year; individual enrollment is appropriate without a D-U-N-S number; allow 1–2 days for approval.
- **App Identifier**: in Certificates, IDs & Profiles → Identifiers, create an App ID with an explicit Bundle ID (e.g. `com.yourorg.AppName`).
- **App Store Connect**: create a new app at `appstoreconnect.apple.com/apps` — set platform (iOS), name, bundle ID, SKU (can match bundle ID), and Full User Access.
- **Hotwire-specific code change**: use Swift compiler directives to switch the root URL between debug and release builds:
  ```swift
  // ios/Hotboard/Hotboard/SceneDelegate.swift
  #if DEBUG
  let rootURL = URL(string: "http://localhost:3000/")!
  #else
  let rootURL = URL(string: "https://yourproduction.url/")!
  #endif
  ```
- **App icon**: required before App Store submission; add `icon.png` to the `AppIcon` asset in Xcode's Assets catalog under the Any Appearance option.
- **Create archive**: Xcode → Product → Archive.
  - If "Signing for X requires a development team": select the project in the navigator → Targets → Signing & Capabilities → set team to your Apple account.
  - If "Your team has no devices": connect a physical iPhone and build to it at least once so Xcode auto-registers it with the developer account.
- **Distribute**: click "Distribute App" → App Store Connect → Distribute; Xcode uploads the build.
- **TestFlight encryption compliance**: in App Store Connect → TestFlight, click Manage next to "Missing Compliance" and select "None of the algorithms" if no custom encryption is used.
- **Internal testing**: create an Internal Testing group in TestFlight, add testers by email; testers receive an email with installation instructions.

## Publishing to Android Play Store

- **Play Console account**: sign up at `play.google.com/apps/publish/signup` — one-time US$25 fee; personal account is appropriate without a D-U-N-S number; allow a few days for verification; requires proof of access to a physical Android device.
- **Create application**: in Play Console click "Create app" and follow the wizard; accept all Declarations.
- **Hotwire-specific code change**: use Gradle `buildConfigField` to inject the base URL per build type instead of hard-coding it:
  ```kotlin
  // android/app/build.gradle.kts
  buildTypes {
      debug {
          buildConfigField("String", "BASE_URL", "\"http://10.0.2.2:3000/\"")
      }
      release {
          buildConfigField("String", "BASE_URL", "\"https://yourproduction.url/\"")
          isMinifyEnabled = false
      }
  }
  ```
  Then in `MainActivity.kt`: `const val baseURL = BuildConfig.BASE_URL`.
- **Create signed release build**: Android Studio → Build → Generate Signed App Bundle or APK → Android App Bundle → create a keystore (`.jks` file identifies the author) → select release build type → click Create; output is typically in `android/app/release/`.
- **Keystore security**: store the keystore file path and passwords in a password manager; add the keystore file path and `app/release/` to `.gitignore`.
- **Upload to Play Console**: Test and release → Testing → Internal testing → Create new release → upload `.aab` file → Save and publish.
- **`applicationId` conflict**: if you reuse `com.masterhotwire.hotboard` from tutorial code, Play Console will reject the upload with a manifest conflict error — change `applicationId` in `build.gradle.kts` to your own identifier.
- **Share with internal testers**: Internal testing → Testers tab → Create email list → add testers → Save changes; testers do not receive automatic notifications — share the internal testing link from the Internal testing screen manually.
