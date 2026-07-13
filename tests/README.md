# tests

This folder contains focused framework checks.

Current coverage:

- `model-harness.test.mjs` verifies local-model role mapping, LM Studio native
  response parsing, and rejection of responses without an actionable message.

Run the current checks with:

```bash
node --test tests/model-harness.test.mjs
```

Future coverage should add agent-prompt integrity, mode links, shell-script
behavior, stop conditions, and repository reference validation.
