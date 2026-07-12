This folder contains a small helper used by orchestrator scripts to select a default or escalated model.

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
