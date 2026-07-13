# Technical Design: SHIELD Team System

## Status

This document describes the repository as it exists today. The system is moving
from its legacy Top Gun presentation toward the inclusive SHIELD team identity,
but most filenames and seat names still use the legacy vocabulary.

## Purpose

`shield-team-system` is a portable operating framework for human and AI software
delivery. It defines who investigates, who decides, who implements, how work is
validated, and when a human must intervene. Its governing principle is to
deliver the smallest safe change that fixes the confirmed problem.

The repository contains prompts, workflow modules, shell helpers, playbooks,
and scorekeeping. It does not contain an application runtime, company data,
credentials, or a fully autonomous agent service.

## Architecture

The framework has five layers:

1. **Charter** - `agents/top-gun-team-charter.agent.md` is the shared operating
   contract. It defines authority, handoffs, escalation, and safety rules.
2. **Seats** - files in `agents/` define focused responsibilities for the
   orchestrator, investigator, architect, implementer, human owner, and external
   review gate.
3. **Modes** - files in `modes/` adapt the charter to a class of work. Debugger
   Mode is the primary implemented workflow. Daily Sortie also exists for
   recurring review and communications sweeps; Feature Sortie and Hotfix
   Intercept remain planned.
4. **Operations** - scripts in `scripts/` support model selection, Jira and
   GitHub coordination, review sweeps, and local-model calls.
5. **Evidence** - `scorecard.md`, plans, command output, tests, and external
   review states record what happened and whether a sortie is ready to advance.

## Seat Boundaries

| Functional seat | Legacy name | Responsibility |
| --- | --- | --- |
| Orchestrator | Stinger | Intake, mode selection, routing, cheap checks, external-system coordination, and bookkeeping |
| Investigator | Jester | Evidence collection, root-cause analysis, facts versus assumptions, and smallest-fix proposal |
| Architect | Viper | Technical judgment, plan approval, risk review, and readiness decisions |
| Implementer | Iceman | Scoped implementation of an approved plan and focused verification |
| Human owner | Maverick | Final authority over scope, risk, tradeoffs, credentials, and destructive actions |
| Review gate | Goose | External review, product feedback, communications state, and merge approval |

The functional names are already accepted by the local adapter and provide a
stable interface while thematic names change. Goose is explicitly a human or
external-state placeholder, not an active AI implementation seat.

## Debugger Lifecycle

Debugger Mode uses seven stages:

1. The orchestrator classifies the defect and gathers inexpensive context.
2. The investigator examines evidence and proposes the smallest supported fix.
3. The architect approves, revises, or returns the mission for more evidence.
4. The implementer changes only the approved scope and adds focused tests when
   appropriate.
5. The orchestrator runs and records the repository validation gate.
6. The architect performs a readiness review.
7. The external review gate approves merge readiness or requests changes.

Handoffs use a common shape: Context, Evidence, Plan, Validation, Risk, and Ask.
Ambiguous requirements, material risk, low confidence, or meaningful tradeoffs
escalate to the human owner.

## Model Routing

`scripts/model/escalation.sh` provides configurable cheap, standard, and strong
model tiers. Its current defaults name hosted models, but environment variables
can replace every tier. The helper is advisory: callers must still decide when
to escalate and invoke the selected model.

`scripts/model/ask-local.mjs` adds a model-agnostic LM Studio adapter. It:

- calls the native `/api/v1/chat` endpoint;
- defaults to the locally served `ornith-1.0-35b` model;
- maps functional and legacy role aliases to existing seat prompts;
- accepts inline missions, mission files, stdin, and explicit context files;
- separates the actionable message from optional reasoning and statistics;
- supports optional API-token authentication;
- keeps calls stateless with `store: false`; and
- can save long responses for supervisor review.

The adapter does not currently grant terminal or repository tools to the local
model. A supervisor must supply authoritative context and execute approved
actions. This is deliberate in the first version and should not be described as
an autonomous coding loop yet.

## Safety Model

Current safety controls are primarily procedural. The charter and seat prompts
prohibit unapproved scope expansion, destructive operations, secret handling,
database resets, unrelated refactors, and unsupported claims. Human authority
and the external review gate remain mandatory at defined boundaries.

The local adapter strengthens privacy by using explicit context files and
stateless calls. It does not scan the repository automatically. These controls
reduce accidental disclosure, but prompt rules alone are not a security
boundary. Any future tool-enabled runner must enforce allowlists in code.

## Current Capabilities

- Shared charter and six defined functional seats
- Debugger Mode and a Daily Sortie workflow
- Planned-mode index and repeatable handoff format
- Shell-based model escalation helper
- Jira, GitHub, and review-sweep operational scripts
- LM Studio native local-model adapter
- Node tests for role mapping and native response parsing
- Scorecard and planning artifacts

## Known Gaps

- Legacy theme names remain throughout filenames, prompts, and documentation.
- The local model can advise but cannot independently inspect or modify the
  repository through this adapter.
- There is no bounded manager/worker/reviewer loop or persisted sortie state.
- Model escalation selection is not yet wired automatically into the adapter.
- Automated coverage does not yet validate prompt links, mode integrity,
  shell-script behavior, or external integrations.
- Goose represents external review but is not an automated reviewer.
- Feature Sortie and Hotfix Intercept are not implemented.

## Path Forward

1. Complete the SHIELD migration using functional seat identifiers as the
   stable API. Rename thematic files and display names separately so behavior
   does not change during the migration.
2. Add a bounded sortie runner that records mission state and permits at most
   three repair cycles before human escalation.
3. Connect model-tier selection to the runner: use the local model for routing,
   investigation, drafting, and routine review; escalate high-risk or repeatedly
   failing work to the configured stronger model.
4. Introduce narrowly scoped tools through allowlisted MCP servers or explicit
   supervisor callbacks. Keep credentials, destructive Git actions, merge, and
   deployment behind human approval.
5. Expand automated checks for role references, mode links, shell helpers, and
   stop-condition enforcement before enabling unattended sorties.

