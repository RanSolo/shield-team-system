#!/usr/bin/env bash
set -euo pipefail

# Model escalation helper
# Provides a small, portable way to pick a default / escalated model for orchestrator scripts.
# Usage examples:
#   source ./scripts/model/escalation.sh
#   get_model cheap
#   escalate_model failure   # prints the escalated model name for a failure trigger

DEFAULT_MODEL="${DEFAULT_MODEL:-claude-haiku-4.5}"
CHEAP_MODEL="${CHEAP_MODEL:-claude-haiku-4.5}"
STANDARD_MODEL="${STANDARD_MODEL:-claude-opus-4.6}"
STRONG_MODEL="${STRONG_MODEL:-gpt-5.3-codex}"

# Returns the model name for a given level: cheap, standard, strong
get_model() {
  case "${1:-default}" in
    cheap)  printf "%s" "${CHEAP_MODEL}" ;;
    standard) printf "%s" "${STANDARD_MODEL}" ;;
    strong) printf "%s" "${STRONG_MODEL}" ;;
    *) printf "%s" "${DEFAULT_MODEL}" ;;
  esac
}

# Given a trigger, print the recommended model. Triggers are advisory strings that
# calling code can use to decide whether to escalate.
# Known triggers:
#  - token_limit: request close to token or cost limits
#  - failure: previous attempt failed and should be retried with a stronger model
#  - high_risk: public-facing, high-risk, or high-ambiguity decisions
#  - code_review: technical peer review (use a stronger specialist)
#  - default: returns the cheap/default model
escalate_model() {
  case "${1:-default}" in
    token_limit|failure|high_risk)
      get_model strong ;;
    code_review)
      get_model standard ;;
    *)
      get_model cheap ;;
  esac
}

# Helper to print a model and optionally export it as SELECTED_MODEL
# Usage: selected=$(select_model token_limit)
select_model() {
  local m
  m=$(escalate_model "${1:-default}")
  if [[ "${2:-}" == "export" ]]; then
    export SELECTED_MODEL="${m}"
  fi
  printf "%s" "${m}"
}

# If script is invoked directly, print usage and chosen model for a sample trigger
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Model escalation helper"
  echo "DEFAULT_MODEL=${DEFAULT_MODEL}"
  echo "Cheap model: ${CHEAP_MODEL}"
  echo "Standard model: ${STANDARD_MODEL}"
  echo "Strong model: ${STRONG_MODEL}"
  echo
  echo "Examples:" 
  echo "  get_model cheap -> $(get_model cheap)"
  echo "  escalate_model failure -> $(escalate_model failure)"
  exit 0
fi
