---
title: Domain-Driven Naming
description: "Bold domain naming, role-based concerns, business language in code"
source:
  type: blog
  title: Domain driven boldness
  author: Jorge Manrubia
  url: https://dev.37signals.com/domain-driven-boldness/
  date: '2022-06-13'
tags:
- rails
- naming
---

# Domain-Driven Naming

Name code after business concepts, not technical operations. Be bold.

## Pattern

Use a dictionary. Write prose descriptions before coding.

```ruby
# BOLD — domain language
def decease
  erect_tombstone
  remove_administratorships
  remove_accesses_later
end

# GENERIC — technical language
def soft_delete
  create_placeholder
  remove_admin_roles
  remove_access
end
```

## Role-Based Concerns

Name concerns after the role the model plays:

```ruby
class Contact < ApplicationRecord
  include Petitioner    # not "HasClearanceRequests"
end

class User < ApplicationRecord
  include Examiner      # not "HandlesClearances"
end
```

## The Test

Would a domain expert recognize the method name without seeing the code? If yes, it's good naming.
