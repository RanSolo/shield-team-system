# TOP GUN AIR WING SCORECARD

_Persistent scoreboard for AI-controlled and user-controlled sorties._

---

## Current Roster

- **Stinger (Orchestrator)** — intake, routing, Nx validation, system ops, and scorekeeping
- **Viper (Architect)** — architecture, scope shaping, readiness review
- **Jester (Debugger/Recon)** — investigation, evidence gathering, reality checks
- **Iceman (Implementer)** — disciplined execution inside approved scope
- **Maverick (Human/Player 1)** — human-controlled wildcard who can occupy any seat
- **Goose (Review Gate Placeholder)** — external review/communications seat for product review in Jira, direct comms, other feedback, waiting states, and final peer review before merge

> Naming rule: keep the callsign first and the original team role in parentheses.

---

## Rules of Engagement

### 1) Fuel Efficiency
- **Total Tokens** = total token burn across all participating seats in the sortie.
- **Successful Token Burn** = total tokens for sorties marked `Success`.
- Lower token burn is better.

### 2) Mission Score
Use blended scoring so cheap missions do not beat valuable missions by default.

```text
Mission Score = ((Outcome Points + Quality Bonuses - Penalties) * 1000) / Total Tokens
```

#### Outcome Points
- `Success` = 100
- `Partial` = 45
- `Failed` = 0

#### Quality Bonuses
- `Within approved scope` = +15
- `No rework requested` = +15
- `Focused validation completed` = +10
- `Tests added/updated when appropriate` = +10
- `Docs updated when appropriate` = +5
- `Excellent handoff / debrief clarity` = +5

#### Penalties
- `Scope drift` = -20
- `Approval bypass` = -40
- `Rework loop required` = -15
- `Unverified completion` = -20
- `Mission abort due to preventable confusion` = -10

### 3) Win Conditions
- **Fuel Miser** = lowest token burn among successful sorties
- **Top Score** = highest blended Mission Score
- **Clean Kill** = success with no penalties
- **Best Human-Controlled Run** = highest Mission Score with Player 1 controlling a seat
- **Best AI-Controlled Run** = highest Mission Score with all seats AI-controlled

---

## Overall Leaderboard

| Player | Control | Sorties | Successes | Success Rate | Avg Tokens | Avg Mission Score | Best Mission Score | Wins |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Stinger (Orchestrator) | AI | 0 | 0 | 0% | 0 | 0 | 0 | 0 |
| Viper (Architect) | AI | 0 | 0 | 0% | 0 | 0 | 0 | 0 |
| Jester (Debugger/Recon) | AI | 0 | 0 | 0% | 0 | 0 | 0 | 0 |
| Iceman (Implementer) | AI | 0 | 0 | 0% | 0 | 0 | 0 | 0 |
| Maverick (Human/Player 1) | User | 0 | 0 | 0% | 0 | 0 | 0 | 0 |
| Goose (Review Gate Placeholder) | External | 0 | 0 | 0% | 0 | 0 | 0 | 0 |

> Add a row when a new callsign or control mode is introduced.

---

## Squadron Standings

### Fuel Efficiency Standings
_Lowest average successful token burn._

| Rank | Callsign | Seat | Control | Avg Successful Tokens | Best Low-Burn Success |
| --- | --- | --- | --- | ---: | ---: |
| 1 | TBD | TBD | TBD | 0 | 0 |
| 2 | TBD | TBD | TBD | 0 | 0 |
| 3 | TBD | TBD | TBD | 0 | 0 |

### Mission Value Standings
_Best cost-vs-outcome blended scoring._

| Rank | Callsign | Seat | Control | Avg Mission Score | Best Mission Score | Success Rate |
| --- | --- | --- | --- | ---: | ---: | ---: |
| 1 | TBD | TBD | TBD | 0 | 0 | 0% |
| 2 | TBD | TBD | TBD | 0 | 0 | 0% |
| 3 | TBD | TBD | TBD | 0 | 0 | 0% |

### Human vs AI

| Controller | Sorties | Successes | Avg Tokens | Avg Mission Score | Best Mission Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| User-Controlled | 0 | 0 | 0 | 0 | 0 |
| AI-Controlled | 0 | 0 | 0 | 0 | 0 |

---

## Hall of Fame

- **Lowest Burn Successful Sortie:** TBD
- **Highest Mission Score:** TBD
- **Cleanest Feature Sortie:** TBD
- **Cleanest Debug Sortie:** TBD
- **Best Maverick (Human/Player 1) Run:** TBD
- **Cleanest Goose Review Gate:** TBD
- **Best AI-Controlled Run:** TBD
- **Steadiest Stinger (Orchestrator) Control:** TBD
- **Most Disciplined Viper (Architect):** TBD
- **Sharpest Jester (Debugger/Recon) Report:** TBD
- **Coldest Iceman (Implementer) Finish:** TBD

---

## Medal Case

Award these when deserved:

- **Fuel Miser** — lowest-token successful sortie
- **Clean Kill** — success with zero penalties
- **First Pass Kill** — approved plan executed with no rework loop
- **By the Book** — approval gate followed perfectly
- **Ghost Rider** — risky move caught before execution
- **Battle Manager** — Stinger handled routing and ops cleanly with minimal token burn
- **Clearance Received** — Goose review gate and external communications were satisfied cleanly with minimal churn
- **Top Cover** — architect prevented downstream confusion
- **Ice Cold Finish** — implementer delivered a tight, disciplined change
- **Picture Perfect Recon** — evidence separated facts from assumptions cleanly
- **Ace Debrief** — excellent After Action Report

---

## Sortie Log

### Sortie 001 — TEMPLATE

**Mission Name:**  
**Mission Type:** Feature Sortie | Debug Scramble | Recon Mission | Hotfix Intercept | Refactor Pass  
**Outcome:** Success | Partial | Failed  
**Threat Level:** Low | Elevated | High | Critical  

#### Flight Crew
- **Stinger (Orchestrator):**  
- **Goose (Review Gate Placeholder):**  
- **Player 1 Character:**  
- **Player 1 Seat:**  
- **Viper (Architect):**  
- **Jester (Debugger/Recon):**  
- **Iceman (Implementer):**  
- **Maverick (Human/Player 1 / Final Authority):**  

#### Control Model
- **User-Controlled Seats:**  
- **AI-Controlled Seats:**  

#### Token Burn
| Seat | Callsign | Controller | Tokens |
| --- | --- | --- | ---: |
| Stinger (Orchestrator) |  |  | 0 |
| Viper (Architect) |  |  | 0 |
| Jester (Debugger/Recon) |  |  | 0 |
| Iceman (Implementer) |  |  | 0 |
| Maverick (Human/Player 1) |  |  | 0 |
| **Total** |  |  | **0** |

#### Quality Assessment
- **Within approved scope:** Yes / No
- **No rework requested:** Yes / No
- **Focused validation completed:** Yes / No
- **Tests added/updated when appropriate:** Yes / No
- **Docs updated when appropriate:** Yes / No
- **Excellent handoff / debrief clarity:** Yes / No
- **Goose peer review completed before merge:** Yes / No / Not applicable
- **Goose source:** GitHub / Jira product review / Atlassian / Direct comms / Other / Not applicable
- **Goose communication sent:** Yes / No / Not applicable

#### Penalties Assessed
- Scope drift: 0
- Approval bypass: 0
- Rework loop required: 0
- Unverified completion: 0
- Preventable confusion: 0

#### Scoring
- **Outcome Points:** 0
- **Quality Bonuses:** 0
- **Penalties:** 0
- **Total Tokens:** 0
- **Mission Score:** 0

#### Debrief
- **Mission:**  
- **Result:**  
- **Changes Made:**  
- **Changes Not Made:**  
- **Unexpected Findings:**  
- **Recommended Next Step:**  
- **Goose Final Review:** Approved / Changes requested / Pending / Not applicable
- **Goose Communication Outcome:** Sent / Waiting / Resolved / Not applicable

#### Awards
- Medal(s):  

---

## Scorekeeper Notes

- Count only **successful sorties** for low-burn win records.
- Log **all sorties** for historical accuracy.
- Keep **user-controlled** and **AI-controlled** runs in the same book, but always mark controller explicitly.
- A low-token mission that failed does **not** outrank a successful mission.
- Feature and debug sorties should both use the same score formula so results stay comparable.
