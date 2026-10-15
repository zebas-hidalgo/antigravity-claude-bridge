---
name: antigravity-executor
description: Use when executing an implementation plan created by Antigravity, or when given a plan file in docs/plans/ to run step-by-step
---

# Antigravity Executor

## Overview
Executes implementation blueprints produced by Antigravity with maximum precision and minimum token consumption. Acts as the focused, disciplined executor in software development or MCP tool operations (like Blender MCP).

## When to Use
- When given a plan file located in `docs/plans/` (e.g. `docs/plans/YYYY-MM-DD-<task>.md`).
- When asked to execute, implement, or model according to an Antigravity blueprint.

Do NOT use when:
- Brainstorming or writing high-level architecture from scratch (delegate that to Antigravity).

---

## Execution Protocol

### Step 1: Load Plan and Establish Checklist
1. Read the specified plan file.
2. Verify which tasks are already marked completed (`- [x]`) and identify the current active Phase.
3. Announce start concisely:  
   *"Executing Phase X: [Phase Name] from [Plan Path]."*

### Step 2: Surgical Task Execution
For each task in the current phase:
1. **No Broad Exploration:** Do not perform recursive searches (`grep`, `glob`) across the codebase unless explicitly required. The plan already provides target files and constraints.
2. **Execute Action:** Apply code edits or call MCP tools directly.
3. **Persist State:** Update the plan file on disk, marking the completed task as `- [x]`.

### Step 3: Phase Verification & Review Checkpoint
1. Run the verification command or check specified in the plan.
2. When the phase passes verification:
   - Mark the phase verification task `- [x]`.
   - **STOP immediately at the `[CHECKPOINT: User Review]`.**
   - Inform the user concisely:
     > *"Phase X complete and verified. Please inspect the changes (or check the 3D model in Blender viewport). Run `/clear` before approving Phase X+1 to reset context and keep token usage minimal."*
3. **DO NOT start the next phase** until the user explicitly responds with approval.

---

## Domain Guidelines

### Software Development
- Run only the target test command specified in the plan. Never run entire project test suites unless commanded.
- If editing code, use precise edits and avoid conversational fluff.

### 3D Modeling (Blender MCP)
- Respect the metric dimensions and bounding boxes in the blueprint.
- Always ensure active context before operations: `context.view_layer.objects.active = obj`.
- Apply scale and rotation (`bpy.ops.object.transform_apply`) before adding Bevel or Subdivision Surface modifiers.
- Use `bpy.data` operations over `bpy.ops` where possible for speed and context safety.

### OpenBIM / Architecture with Bonsai (BlenderBIM)
- Access the active IFC model via Bonsai (`import bonsai.bim.tool as tool; model = tool.Ifc.get()`).
- Use `ifcopenshell.api` to instantiate architectural elements (`ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcWall")`).
- Always assign created entities to their designated `IfcBuildingStorey` container (`ifcopenshell.api.run("spatial.assign_container", model, relating_structure=storey, products=[element])`).
- Do not create unclassified generic Blender meshes for walls/slabs; preserve semantic IFC data.

---

## Error Protocol (Fast-Stop for Antigravity)

If any command, test, or MCP tool call fails:
1. You may attempt **ONE (1)** quick self-correction if the fix is trivial (e.g. minor syntax typo or missing import).
2. If it fails a second time: **STOP IMMEDIATELY**. Do not enter a trial-and-error loop.
3. In the plan file, mark the task as blocked: `- [BLOCKED] Task X.Y`.
4. Output the diagnostic report block:

```markdown
### [ANTIGRAVITY DIAGNOSTIC REPORT]
- **Phase / Task Failed:** <Phase and Task number>
- **Command / Action:** <Executed action>
- **Error Output:** <Exact error output or stack trace>
- **Suspected Cause:** <One concise sentence on the issue>
```

Prompt the user:
*"Execution paused. You can paste this diagnostic block into Antigravity to adjust the blueprint without burning further tokens."*
