This folder contains model-selection helpers and the local-model adapter used by
SHIELD roles.

## Local model teammate

LM Studio must be serving a compatible model on port 1234. Ornith 1.0 35B is
the current default, but it is not baked into the team identity. Run a role with
an inline mission:

```bash
node scripts/model/ask-local.mjs orchestrator "Choose the next issue and state the stop condition."
```

For a larger mission, use a file or stdin:

```bash
node scripts/model/ask-local.mjs implementer --file mission.md
cat mission.md | node scripts/model/ask-local.mjs reviewer
```

Give the model authoritative repository context with one or more `--context`
arguments:

```bash
node scripts/model/ask-local.mjs implementer \
  "Review the adapter and recommend the next validation step." \
  --context scripts/model/ask-local.mjs \
  --context tests/model-harness.test.mjs
```

Role prompts tell Ornith how to work; context files tell it what is actually in
the repository. Calls without context are appropriate only for generic routing
or planning questions.

The adapter uses LM Studio's native `/api/v1/chat` endpoint. It prints only the
local model's actionable message by default. Diagnostic output is opt-in:

```bash
node scripts/model/ask-local.mjs investigator --file mission.md --show-reasoning --show-stats
```

Save a long artifact for supervisor review instead of printing it:

```bash
node scripts/model/ask-local.mjs architect --file mission.md --output /tmp/local-draft.md
```

Configuration:

- `LOCAL_MODEL_BASE_URL` defaults to `http://127.0.0.1:1234`.
- `LOCAL_MODEL_ID` defaults to `ornith-1.0-35b`.
- `LOCAL_MODEL_API_TOKEN` is optional and is sent only when LM Studio authentication
  is enabled.

Calls are stateless by default (`store: false`) so repository missions do not
accumulate as persistent LM Studio chat history.

Role aliases map to the existing prompts in `agents/`: `orchestrator`/`stinger`,
`investigator`/`jester`, `architect`/`viper`, `implementer`/`iceman`, and
`reviewer`/`goose`.

Run the adapter tests with:

```bash
node --test tests/model-harness.test.mjs
```

## Model escalation

Behavior

- Default models are configurable via environment variables:
  - DEFAULT_MODEL (fallback if nothing specified)
  - CHEAP_MODEL
  - STANDARD_MODEL
  - STRONG_MODEL

- Functions provided by sourcing this file:
  - get_model <cheap|standard|strong|default>
  - escalate_model <trigger>
  - select_model <trigger> [export]

Triggers are advisory strings like: token_limit, failure, high_risk, code_review.

Example usage from a script:

  source "$(dirname "$0")/model/escalation.sh"
  MODEL_TO_USE=$(escalate_model failure)
  # or export for later usage
  select_model failure export
  echo "Using model: $SELECTED_MODEL"
