---
title: "Console Data Protection"
description: "Active Record Encryption, Console1984 audit logging, mandatory justification for data access"
source:
  type: blog
  title: "Navigating personal information with care"
  author: "Jorge Manrubia"
  url: "https://dev.37signals.com/navigating-personal-information-with-care/"
  date: "2023-09-24"
tags: [rails, security]
---

# Console Data Protection

Default: developers cannot view personal information. Access requires explicit decryption with auditing.

## Active Record Encryption

Rails 7+ encrypts sensitive columns at rest. In Rails console, encrypted fields show ciphertext by default.

```ruby
# Encrypted fields are unreadable without explicit decryption
user = User.find(1)
user.email  # => "[encrypted]"
```

## Console1984

Open-source gem that wraps Rails console with access controls:

- **Mandatory justification** — every console session requires a reason
- **Two modes** — protected (encrypted, default) and unprotected (decrypted)
- **Audit trail** — all commands recorded, sensitive sessions flagged

```ruby
# Default: protected mode, encrypted data stays encrypted
>> user.email
# => ciphertext

# Explicit opt-in to view sensitive data
>> decrypt!
# System requires documented customer consent (URL)
>> user.email
# => "actual@email.com"

# Return to protected mode
>> encrypt!
```

## Audits1984

Companion auditing dashboard:

- Auditors review session justifications, consent links, and executed commands
- Approve/reject mechanism per session
- Bi-weekly summary reports drive tooling improvements

## Mass Encryption

Use `mass_encryption` for bulk-encrypting existing records when adopting Active Record Encryption on legacy data.

## Key Principles

- **Default deny** — no access to personal data without explicit action
- **Consent-driven** — customer consent URL required before decryption
- **Accountable** — every access logged and reviewed
- **Shift-based auditing** — rotating audit responsibility across the team
