# Mission Modes

Use a small core charter plus a mode module loaded at mission start.

## Active order

1. **Debugger Mode** — first module, used for bug investigation and fix flow.

## Planned next modules

2. **Feature Mission** — for scoped feature delivery and lane coordination.
3. **Daily Briefing** — for recurring status checks across Jira, GitHub, and review queues.
4. **Hotfix Response** — for urgent production or release-blocking fixes.

## Mode selection rule

- If the mission starts from a bug, failing test, runtime issue, or unclear defect, load **Debugger Mode**.
- If the mission starts from planned feature work, load **Feature Mission** when it exists.
- If the mission is a recurring check or comms sweep, load **Daily Briefing**.
- If the mission is urgent and production-facing, load **Hotfix Response** when it exists.

## Loading rule

Maria Hill selects or confirms the mode at mission start and then follows the matching module.
