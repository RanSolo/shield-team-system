# Sortie Modes

Use a small core charter plus a mode module loaded at sortie start.

## Active order

1. **Debugger Mode** — first module, used for bug investigation and fix flow.

## Planned next modules

2. **Feature Sortie** — for scoped feature delivery and lane coordination.
3. **Daily Sortie** — for recurring status checks across Jira, GitHub, and review queues.
4. **Hotfix Intercept** — for urgent production or release-blocking fixes.

## Mode selection rule

- If the sortie starts from a bug, failing test, runtime issue, or unclear defect, load **Debugger Mode**.
- If the sortie starts from planned feature work, load **Feature Sortie** when it exists.
- If the sortie is a recurring check or comms sweep, load **Daily Sortie**.
- If the sortie is urgent and production-facing, load **Hotfix Intercept** when it exists.

## Loading rule

Stinger selects or confirms the mode at sortie start and then follows the matching module.
