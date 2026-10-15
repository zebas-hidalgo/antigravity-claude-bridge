# [3D Blueprint] <Model Name>

- **Target Agent:** Claude Code (with `antigravity-executor` skill)
- **Mode:** Phased 3D Modeling with Viewport Review Checkpoints
- **Domain:** 3D Modeling / Blender MCP
- **Target Scene:** Active Blender file via Blender MCP server

---

## 3D Specifications & Constraints
- **Total Bounding Box (X, Y, Z):** `<e.g. 0.60m x 0.60m x 0.85m>`
- **Scale / Units:** Metric (Meters)
- **Target Collection:** `<e.g. Collection_Asset_Name>`
- **Topology Budget:** `<e.g. Mid-poly, clean quads, subdiv-ready>`
- **Origin / Pivot:** `<e.g. Bottom center at (0, 0, 0)>`

---

## Phase 1: Blockout & Primary Geometry
<!-- Goal: Generate bounding volumes, core primitives, and main pivots -->

- [ ] Task 1.1: Setup collection hierarchy and primary base mesh.
  - **Object Name:** `<ObjectName>`
  - **Dimensions / Location:** `<X, Y, Z>`
  - **Modeling Directive:** Use Python `bpy` via MCP to instantiate geometry. Ensure origin is aligned.
- [ ] Task 1.2: Apply initial modifiers and basic transforms.
  - **Modifiers:** `<e.g. Mirror along X, Array 5x radial>`
  - **Rule:** Apply scale and rotation (`bpy.ops.object.transform_apply`) before adding deformation modifiers.
- [ ] Verification 1.3: Inspect scene hierarchy and object bounding box.
  - **Check:** Query Blender MCP to ensure `<ObjectName>` exists in `<Collection>` with dimensions `<Dimensions>`.

> **[CHECKPOINT: User Review]**  
> Stop here. Inform user that Phase 1 blockout is complete in Blender. Ask user to inspect the viewport. Wait for approval. Recommend `/clear` before proceeding to Phase 2.

---

## Phase 2: Detailing, Bevels & Modifiers
<!-- Goal: High-precision modeling, edge loops, bevel weights, subdivision -->

- [ ] Task 2.1: Model secondary structural components.
  - **Object Name:** `<ObjectName_Part2>`
  - **Directives:** Connect with parent object, maintain proportion to Phase 1.
- [ ] Task 2.2: Add bevels, solidify, or subdivision surface modifiers.
- [ ] Verification 2.3: Check mesh topology (no non-manifold edges or inverted normals).

> **[CHECKPOINT: User Review]**  
> Stop here. Inspect viewport. Wait for user approval before moving to materials/shading. Recommend `/clear`.

---

## Phase 3: PBR Materials & Shading

- [ ] Task 3.1: Configure Principled BSDF shader nodes.
  - **Material 1:** `<Name, Base Color, Roughness, Metallic>`
  - **Material 2:** `<Name, Base Color, Roughness, Metallic>`
- [ ] Task 3.2: Assign materials to respective objects or vertex groups.
- [ ] Verification 3.3: Verify all objects have valid active material slots.

> **[CHECKPOINT: User Review]**  
> Model finished. Final user inspection and render preview.

---

## Error Protocol
If an operation in Blender MCP fails:
1. Max 1 quick self-correction attempt.
2. If context error or syntax fails again, mark `[BLOCKED]` and output:

```markdown
### [ANTIGRAVITY DIAGNOSTIC REPORT]
- **Phase / Task Failed:** <Task Number>
- **Blender Object / Context:** <Active Object>
- **Error Trace:** <Error from Blender MCP>
- **Suspected Cause:** <1 sentence diagnosis>
```
