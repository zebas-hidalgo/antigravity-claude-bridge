"""
Bonsai (BlenderBIM) & IfcOpenShell Python API Reference Cheatsheet
Tested for Bonsai BIM on Blender 4.x / IfcOpenShell 0.8+
Used by Claude Opus 5.5 and Antigravity for automated OpenBIM authoring.
"""

import bpy
import ifcopenshell
import ifcopenshell.api

def get_or_create_bonsai_model():
    """Gets the active IFC model from Bonsai or initializes a new IFC4 project."""
    try:
        import bonsai.bim.tool as tool
        model = tool.Ifc.get()
        if model:
            return model
    except (ImportError, AttributeError):
        pass

    # Fallback to older blenderbim namespace if applicable
    try:
        import blenderbim.tool as tool
        model = tool.Ifc.get()
        if model:
            return model
    except (ImportError, AttributeError):
        pass

    # Create fresh in-memory IFC4 model if none active
    model = ifcopenshell.file(schema="IFC4")
    return model


def setup_project_hierarchy(model, project_name="OpenBIM_Project", site_name="Site_01", building_name="Building_A"):
    """Sets up standard IfcProject -> IfcSite -> IfcBuilding spatial containment."""
    project = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcProject", name=project_name)
    ifcopenshell.api.run("unit.assign_unit", model, length={"is_metric": True, "raw": "METERS"})
    
    site = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcSite", name=site_name)
    building = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcBuilding", name=building_name)
    
    ifcopenshell.api.run("aggregate.assign_object", model, relating_object=project, products=[site])
    ifcopenshell.api.run("aggregate.assign_object", model, relating_object=site, products=[building])
    
    return project, site, building


def add_building_storey(model, building, name="Level 00 (Ground)", elevation=0.0):
    """Adds an IfcBuildingStorey at a specific metric Z elevation."""
    storey = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcBuildingStorey", name=name)
    storey.Elevation = float(elevation)
    ifcopenshell.api.run("aggregate.assign_object", model, relating_object=building, products=[storey])
    return storey


def create_ifc_wall(model, storey, name="Wall_01", length=5.0, height=3.0, thickness=0.20, x=0.0, y=0.0, z=0.0):
    """
    Creates an IfcWall, assigns it to a storey, and generates a solid extruded representation.
    """
    wall = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcWall", name=name)
    ifcopenshell.api.run("spatial.assign_container", model, relating_structure=storey, products=[wall])
    
    # Locate in 3D space
    matrix = [
        [1.0, 0.0, 0.0, float(x)],
        [0.0, 1.0, 0.0, float(y)],
        [0.0, 0.0, 1.0, float(z)],
        [0.0, 0.0, 0.0, 1.0]
    ]
    ifcopenshell.api.run("geometry.edit_object_placement", model, product=wall, matrix=matrix)
    
    # Add geometric body representation
    body = ifcopenshell.api.run(
        "geometry.add_wall_representation",
        model,
        context=model.by_type("IfcGeometricRepresentationContext")[0] if model.by_type("IfcGeometricRepresentationContext") else None,
        length=float(length),
        height=float(height),
        thickness=float(thickness)
    )
    if body:
        ifcopenshell.api.run("geometry.assign_representation", model, product=wall, representation=body)
        
    return wall


def create_ifc_slab(model, storey, name="Slab_Ground", length=10.0, width=8.0, thickness=0.25, x=0.0, y=0.0, z=0.0):
    """Creates an IfcSlab assigned to a storey."""
    slab = ifcopenshell.api.run("root.create_entity", model, ifc_class="IfcSlab", name=name)
    ifcopenshell.api.run("spatial.assign_container", model, relating_structure=storey, products=[slab])
    
    matrix = [
        [1.0, 0.0, 0.0, float(x)],
        [0.0, 1.0, 0.0, float(y)],
        [0.0, 0.0, 1.0, float(z)],
        [0.0, 0.0, 0.0, 1.0]
    ]
    ifcopenshell.api.run("geometry.edit_object_placement", model, product=slab, matrix=matrix)
    return slab


def sync_bonsai_ui():
    """Forces Bonsai in Blender 3D Viewport to refresh spatial tree and visuals."""
    try:
        import bonsai.bim.tool as tool
        tool.Ifc.update_representation()
    except Exception:
        pass
    bpy.context.view_layer.update()
