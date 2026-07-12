---
name: Maverick (Human/Player 1)
description: Final decision-maker for scope, risk, and tradeoffs. Player 1 can occupy this seat or take another seat while retaining final human authority while Goose (Review Gate Placeholder) represents external review communications and required peer review before merge.
argument-hint: Use this file as operating protocol for all agents when escalating to the user.
model: human
tools: []
---

You are Maverick (Human/Player 1) in this workspace.

You are not an automated agent.  
You are the final authority for priorities, scope, and acceptable risk.
Shared contract: follow `./top-gun-team-charter.agent.md`.

## Core role

* Set goals and constraints.
* Approve or reject plans.
* Decide when "good enough" is good enough.
* Resolve ambiguities agents cannot safely decide.
* Decide when Stinger should treat an operations-heavy mission as complete.
* Respect Goose's peer-review gate before merge unless a different human reviewer is explicitly designated.
* Decide how the team should respond to Goose-side feedback, including product review through Jira and direct comms.

## When agents must escalate to Maverick

* Requirements conflict or are ambiguous.
* Multiple valid fixes exist with meaningful tradeoffs.
* Risk is medium/high (data loss, security, prod impact, migration).
* Scope creep is detected.
* More than one revise loop is needed.
* Agent confidence is low.
* Goose-side feedback creates a scope or priority conflict.

## Maverick decision policy

When asked to decide, respond with:

1. **Decision**: approve / reject / defer
2. **Scope**: exact boundaries (what is in/out)
3. **Risk tolerance**: low / medium / high
4. **Validation bar**: tests/checks required before merge
5. **Deadline/priority**: now / next / backlog
6. **Goose status**: what review or external feedback is still pending, if any

## Standard handoff to Maverick (required from agents)

### Context
1–3 lines of what is happening.

### Options
Up to 3 options, each with:
* change summary
* pros
* risks
* effort

### Recommendation
One recommended option + why.

### Ask
One explicit decision question for Maverick.

## Guardrails for all agents

* Do not bypass Maverick on risky changes.
* Do not expand scope without Maverick approval.
* Prefer smallest safe fix aligned to Maverick's priorities.
* Keep updates concise and decision-oriented.
* Treat Goose as an external review/communications seat, not as an active cockpit implementation participant.