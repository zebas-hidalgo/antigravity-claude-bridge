# [Bonsai OpenBIM Blueprint] <Building / Project Name>

- **Target Agent:** Claude Desktop App (Opus 5.5) / Claude Code
- **Mode:** Phased OpenBIM Architecture with Viewport & IFC Checkpoints
- **Domain:** OpenBIM / Architectural Modeling with Bonsai (BlenderBIM)
- **Target Scene:** Active Bonsai IFC Project in Blender via Blender MCP

---

## 🏛️ BIM Spatial Structure & IFC Schema
- **IFC Schema:** IFC4
- **Project Name:** `<e.g. Residencia_Moderna>`
- **Length Units:** Metric (Meters)
- **Levels / Storeys:**
  - `Nivel_00_PB`: Elevation Z = 0.00m, Height = 3.00m
  - `Nivel_01_PA`: Elevation Z = +3.00m, Height = 2.80m
- **Coordinate Reference System:** Local Cartesian (Origin at 0, 0, 0)

---

## Phase 1: Spatial Hierarchy & Foundation / Ground Slab
<!-- Goal: Initialize IfcProject, Spatial Containers, and base slab -->

- [ ] Task 1.1: Ensure active IFC Project exists in Bonsai or initialize `IfcProject`.
  - **Tooling:** Use `import bonsai.bim.tool as tool; model = tool.Ifc.get()`
  - **Containers:** Create `IfcSite`, `IfcBuilding`, and `IfcBuildingStorey` (`Nivel_00_PB`).
- [ ] Task 1.2: Model Ground Slab (`IfcSlab`).
  - **Dimensions:** `<X x Y, e.g. 12.00m x 8.00m, Thickness = 0.25m>`
  - **Spatial Container:** Assign to `Nivel_00_PB`.
- [ ] Verification 1.3: Verify `IfcSlab` is linked to spatial hierarchy in Bonsai panel.

> **[CHECKPOINT: User Review]**  
> Stop here. Inform user that Phase 1 spatial hierarchy and ground slab are complete in Bonsai. Inspect viewport. Wait for approval before starting walls. Recommend `/clear` (or new chat turn).

---

## Phase 2: Exterior & Interior Walls (`IfcWall`)
<!-- Goal: Generate parametric walls with correct thickness, height, and alignment -->

- [ ] Task 2.1: Model Perimeter Exterior Walls.
  - **IFC Class:** `IfcWall`
  - **Thickness:** 0.20m
  - **Height:** 3.00m (unconnected or constrained to next level)
  - **Coordinates:** Baselines from (0,0) to perimeter corners.
- [ ] Task 2.2: Model Interior Partition Walls.
  - **Thickness:** 0.10m
  - **Height:** 3.00m
- [ ] Verification 2.3: Verify wall intersections and ensure all walls belong to `Nivel_00_PB`.

> **[CHECKPOINT: User Review]**  
> Stop here. Inspect wall layout and room enclosures in Blender 3D Viewport. Wait for user approval before generating openings.

---

## Phase 3: Openings, Doors & Windows (`IfcDoor`, `IfcWindow`)

- [ ] Task 3.1: Insert Door Openings and `IfcDoor` entities.
  - **Doors:** `<Dimensions, e.g. 0.90m x 2.10m on Wall_X>`
- [ ] Task 3.2: Insert Window Openings and `IfcWindow` entities.
  - **Windows:** `<Dimensions, e.g. 1.50m x 1.20m, Sill Height = 0.90m>`
- [ ] Verification 3.3: Verify boolean voids in walls are properly cutting openings.

> **[CHECKPOINT: User Review]**  
> Stop here. Review door and window placements in Blender.

---

## Phase 4: Upper Level / Roof Slab (`IfcSlab` / `IfcRoof`)

- [ ] Task 4.1: Model upper slab or roof structure.
- [ ] Task 4.2: Verify full IFC project integrity and exportability.

> **[CHECKPOINT: User Review]**  
> OpenBIM modeling complete. Final IFC validation and 3D review.

---

## Error Protocol
If an IfcOpenShell or Bonsai tool call fails:
1. Max 1 quick self-correction attempt.
2. If context error or IFC schema validation fails again, mark `[BLOCKED]` and output:

```markdown
### [ANTIGRAVITY DIAGNOSTIC REPORT]
- **Phase / Task Failed:** <Task Number>
- **Bonsai Entity / IFC Class:** <e.g. IfcWall, IfcSlab>
- **Error Trace:** <Error from Blender MCP / IfcOpenShell>
- **Suspected Cause:** <1 sentence diagnosis>
```
