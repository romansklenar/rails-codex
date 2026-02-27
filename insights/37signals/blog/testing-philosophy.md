---
title: "Testing Philosophy"
source: https://dev.37signals.com/pending-tests/
description: "Pragmatic testing with real dependencies, confidence over coverage"
tags: [testing, process]
---

# Testing Philosophy

Pragmatic testing focused on confidence, not ceremony.

## Test Real Dependencies

Prefer tests that exercise actual implementations over mocked units:

```ruby
# GOOD — real objects, real behavior
it 'closes the case' do
  record = create(:case, status: 'opened', deleted_at: nil)
  record.close!(reason: 'resolved')
  expect(record.reload.status).to eq('closed')
end

# AVOID — mocking hides real behavior
it 'closes the case' do
  closer = instance_double(Case::Closer)
  allow(closer).to receive(:execute)
  # Tests nothing meaningful
end
```

## Test After, Not Before

Write tests after development when exploring product code. Write tests first only when a test offers the shortest feedback loop (e.g. infrastructure, complex algorithms).

## Confidence Over Coverage

- A few integration tests covering real flows > many unit tests with mocks
- Don't chase 100% coverage; chase confidence in critical paths
- If mocking makes a test faster but less trustworthy, skip the mock

## When Mocks Are Fine

- External APIs (Airtable, Mailgun) — use `WebMock`/`VCR`
- Time-dependent behavior — use `travel_to`
- See `testing/test-doubles.md` for full doubles guidance
