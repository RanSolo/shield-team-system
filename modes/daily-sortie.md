# Daily Sortie

Recurring review-and-comms sweep for Stinger and Goose.

Use this mode for:

- checking Jira product review queues
- checking GitHub review state
- checking external wait states
- producing a lightweight daily action list

## Lead seat

**Stinger (Orchestrator)** leads the operational sweep.  
**Goose (Review Gate Placeholder)** represents the external review/comms state.

## Flow

1. **Stinger queue sweep**
   - run Jira product review checks
   - run GitHub review checks
   - identify anything blocked on Goose

2. **Classification**
   - waiting on us
   - waiting on product
   - waiting on peer review
   - resolved

3. **Routing**
   - scope/product answer needed -> Maverick
   - architecture answer needed -> Viper
   - bug evidence answer needed -> Jester
   - implementation status answer needed -> Iceman
   - simple response/status push -> Stinger

4. **Goose comms**
   - send or prepare Jira/GitHub/Atlassian/direct comms updates
   - mark what is still pending

## Standard commands

Start with:

- [goose-review-sweep.sh](../scripts/daily-sortie/goose-review-sweep.sh)
- [product-review-queue.sh](../scripts/jira/product-review-queue.sh)
- [maverick-sprint-tickets.sh](../scripts/jira/maverick-sprint-tickets.sh)

## Output

Daily Sortie should end with:

- open Jira product review items
- open GitHub review items
- who needs to answer next
- what Goose still has pending
