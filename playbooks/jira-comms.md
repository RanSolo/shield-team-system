# Jira Comms Protocol

Use this playbook when **Goose (Review Gate Placeholder)** is carrying product review or feedback through Jira.

## Ownership

- **Goose** represents the Jira-side review thread.
- **Stinger** gathers ticket state, drafts updates, and tracks waiting/resolved status.
- **Maverick** decides the response when scope, priority, or acceptance changes.
- **Viper** provides architecture or design rationale when needed.
- **Jester** provides evidence for bug or defect questions.
- **Iceman** provides implementation status and exact change summaries.

## Standard Jira states

- **Waiting on us** — Jira comment or product review requires a response.
- **Waiting on Goose** — response is drafted and pending external review/approval.
- **Waiting on product** — team replied and is waiting on product follow-up.
- **Resolved** — review feedback is answered or accepted.

## Response routing

- **Product / acceptance / scope** -> Maverick
- **Architecture / technical approach** -> Viper
- **Bug evidence / defect clarification** -> Jester
- **Implementation status / what changed** -> Iceman
- **Administrative update / coordination / status push** -> Stinger

## Response template

Stinger or Goose should structure Jira updates as:

1. **Context** — what request or review comment is being addressed
2. **Current status** — implemented / investigating / pending / blocked
3. **Decision or answer** — what the team is saying back
4. **Impact** — scope, behavior, or release implications
5. **Next step** — what the team or product should expect next

## CLI foundation

Use the scripts in [scripts/jira/](../scripts/jira):

- [product-review-queue.sh](../scripts/jira/product-review-queue.sh) — list Jira items needing product review attention
- [maverick-sprint-tickets.sh](../scripts/jira/maverick-sprint-tickets.sh) — list current sprint issues, Maverick-assigned issues, unclaimed issues, or a triage combination
- [draft-product-review-response.sh](../scripts/jira/draft-product-review-response.sh) — generate a structured Jira response template

For recurring review sweeps, use:

- [goose-review-sweep.sh](../scripts/daily-sortie/goose-review-sweep.sh)

## Environment expectations

For live Jira checks, set:

- `JIRA_BASE_URL`
- `JIRA_USER_EMAIL`
- `JIRA_API_TOKEN`

Optional:

- `JIRA_PRODUCT_REVIEW_JQL`
- `JIRA_MAVERICK_EMAIL`
- `JIRA_MAX_RESULTS`

The scripts fail loudly if required credentials are missing.
