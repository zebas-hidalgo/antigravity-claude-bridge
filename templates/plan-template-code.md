# [Plan] <Feature / Refactor Name>

- **Target Agent:** Claude Code (with `antigravity-executor` skill)
- **Mode:** Phased with Review Checkpoints
- **Domain:** Software Engineering
- **Target Verification:** `<Primary test command, e.g. pnpm vitest run tests/auth.test.ts>`

---

## Architecture Summary
<!-- Brief 2-3 sentence overview of the technical approach, affected modules, and constraints -->
<Overview of the change>

---

## Phase 1: <Phase Name, e.g. Domain Entities & Database Schema>
<!-- Goal: Self-contained milestone with its own verification -->

- [ ] Task 1.1: <Exact action>
  - **File:** `path/to/file.ts`
  - **Function / Symbol:** `functionName`
  - **Details:** <Prescriptive explanation of the change>
- [ ] Task 1.2: <Next action>
  - **File:** `path/to/another_file.ts`
  - **Details:** <What to add or modify>
- [ ] Verification 1.3: Run phase verification command.
  - **Command:** `<exact command, e.g. pnpm test -- tests/unit/phase1.test.ts>`
  - **Expected Outcome:** `<All tests pass>`

> **[CHECKPOINT: User Review]**  
> Stop here. Report that Phase 1 is complete and tests have passed. Wait for human confirmation before proceeding to Phase 2. Recommend running `/clear` to reset context before the next phase.

---

## Phase 2: <Phase Name, e.g. Service Logic & Handlers>

- [ ] Task 2.1: <Action>
  - **File:** `path/to/service.ts`
  - **Details:** <Details>
- [ ] Task 2.2: <Action>
  - **File:** `path/to/handler.ts`
  - **Details:** <Details>
- [ ] Verification 2.3: Run integration test.
  - **Command:** `<exact command>`
  - **Expected Outcome:** `<Success output>`

> **[CHECKPOINT: User Review]**  
> Stop here. Wait for human approval before proceeding. Recommend running `/clear`.

---

## Error Protocol
If any task fails after 1 quick self-correction attempt:
1. Mark the task as `[BLOCKED]` in this file.
2. Output the diagnostic block below and halt:

```markdown
### [ANTIGRAVITY DIAGNOSTIC REPORT]
- **Phase / Task Failed:** <Task Number>
- **Command / Action:** <Executed action>
- **Error Output:** <Exact error trace>
- **Suspected Cause:** <1 sentence diagnosis>
```
