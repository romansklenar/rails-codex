---
title: "Action Push Native"
source: https://dev.37signals.com/introducing-action-push-native/
description: "Push notifications to APNs/FCM via Rails gem with HTTP/2 persistent connections"
tags: [rails, native, push-notifications]
---

# Action Push Native

Rails gem for sending push notifications directly to Apple Push Notification service (APNs) and Google Firebase Cloud Messaging (FCM). Built by 37signals as a replacement for AWS Pinpoint.

## Key Characteristics

- **HTTP/2 persistent connections** to APNs (significant performance gain over HTTP/1)
- Battle-tested: handles 10M+ daily notifications in production (HEY, Basecamp)
- Automatic retry, rate-limiting, and dead device removal
- No third-party notification service dependency (direct to Apple/Google)

## Basic Usage

```ruby
# Create a device record
device = ApplicationPushDevice.create!(
  name: "iPhone 16",
  token: "6c267f26b173cd9595ae2f6702b1ab560371a60e7c8a9e27419bd0fa4a42e58f",
  platform: "apple"
)

# Build and send a notification
notification = ApplicationPushNotification.new(
  title: "Hello world!",
  body: "Welcome to Action Push Native"
)

notification.deliver_later_to(device)
```

## When to Use

- Hotwire Native apps that need push notifications
- Replaces AWS SNS/Pinpoint or third-party services (OneSignal, Firebase-only)
- Pairs with Hotwire Native for native app notification handling

## Architecture Notes

- Follows Active* naming convention (like Action Mailer for email)
- `deliver_later_to` mirrors Action Mailer's `deliver_later` pattern
- Device token management (registration, removal of stale tokens) is built in
- Platform credentials configured per-environment
