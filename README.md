# Antigravity <-> Claude <-> Blender Bonsai Bridge

> **A Next-Generation OpenBIM & Multi-Agent Collaborative Protocol uniting Google Antigravity (High-Context Strategic Architect), Anthropic Claude (Opus 5.5 / Sonnet Surgical Executor), and Blender (Native OpenBIM authoring powered by Bonsai & IfcOpenShell).**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Standards: OpenBIM IFC4](https://img.shields.io/badge/Standards-OpenBIM%20IFC4-005596.svg)](https://www.buildingsmart.org/standards/bsi-standards/industry-foundation-classes/)
[![Compatibility: Blender 4.x](https://img.shields.io/badge/Blender-4.x%20%2B%20Bonsai-E87D0D.svg)](https://bonsaibim.org/)
[![Model: Claude Opus 5.5](https://img.shields.io/badge/Recommended-Claude%20Opus%205.5%20(Adaptive%20Thinking)-7A52B3.svg)]()
[![Model: Gemini 2.5 / 3 Pro](https://img.shields.io/badge/Planner-Gemini%202.5%20%2F%203%20Pro%20(Antigravity)-4285F4.svg)]()

---

## 🌟 Executive Overview

Autonomous AI coding and 3D modeling typically face severe failure modes when executed in isolation:
1. **Context Window Exhaustion:** Claude burns 50% to 70% of its budget searching repositories, inspecting directories, or processing noisy console outputs.
2. **Cognitive Overload in 3D/BIM:** Forcing a single prompt to calculate spatial coordinates, architectural programs, parametric building codes, and API syntax leads to hallucinated scales, broken topologies, or unclassified generic polygons.

### The Triangular Division of Labor

```mermaid
flowchart TD
    subgraph Antigravity ["1. ANTIGRAVITY (The High-Context Architect)"]
        A1["Gemini 2.5/3 Pro (1M–2M Context)"]
        A2["Ingesta documentación, códigos y normativas"]
        A3["Diseña el programa espacial y cotas Z"]
        A4["Genera Blueprints por fases en docs/plans/"]
    end

    subgraph Claude ["2. CLAUDE DESKTOP / CODE (The BIM Author)"]
        B1["Claude Opus 5.5 con Adaptive Thinking"]
        B2["Cero exploración a ciegas: Lee el blueprint enfocado"]
        B3["Trigonometría y llamadas IfcOpenShell precisas"]
        B4["Ejecuta herramientas vía Blender MCP"]
    end

    subgraph Blender ["3. BLENDER + BONSAI (The Visual OpenBIM Host)"]
        C1["Bonsai Add-on (IfcOpenShell Engine)"]
        C2["Genera entidades IFC nativas (IfcWall, IfcSlab)"]
        C3["Renderiza en tiempo real en el Viewport 3D"]
        C4["Mantiene el árbol espacial IFC exportable"]
    end

    subgraph Reviewer ["4. INSPECTOR HUMANO (Tú)"]
        D1["Inspecciona el Viewport 3D y árbol Bonsai"]
        D2["Aprueba o ajusta en cada Checkpoint"]
    end

    Antigravity -->|Blueprint Paramétrico| Claude
    Claude -->|Llamadas MCP / bpy| Blender
    Blender -->|Feedback Visual| Reviewer
    Reviewer -->|Aprobación de Fase| Claude
```

---

## 📊 Token Economics: Why This Saves 70%–85%

| Metric | Autonomous Claude (Solo) | Triangular Bridge (Antigravity + Claude + Bonsai) | Net Impact |
| :--- | :--- | :--- | :--- |
| **Input Context Overhead** | 800.000 – 1.400.000 tokens *(re-enviando todo el repo en cada turno)* | 100.000 – 180.000 tokens *(sólo el plan específico de la fase)* | **~85% de ahorro** |
| **Terminal / Console Noise** | 100.000 – 200.000 tokens *(trazas de error y logs sin filtrar)* | 15.000 – 25.000 tokens *(comprimido con RTK / filtrado MCP)* | **~80% de ahorro** |
| **Conversational Output** | 15.000 – 25.000 tokens *(explicaciones y cortesías)* | 3.000 – 5.000 tokens *(ejecución directa y concisa)* | **~75% de ahorro** |
| **Turnos de Ensayo y Error** | 12 a 20 turnos | 3 a 5 turnos estructurados | **~70% menos turnos** |
| **Costo por Modelo / Tarea** | **$4.00 – $8.00 USD** | **$0.40 – $0.90 USD** | **80% a 85% más barato** |

---

## 🔄 Sequence Workflow: From Idea to OpenBIM Model

```mermaid
sequenceDiagram
    autonumber
    actor User as Usuario (Revisor)
    participant AG as Antigravity (Gemini)
    participant Claude as Claude Desktop (Opus 5.5)
    participant Blender as Blender 3D (Bonsai MCP)

    User->>AG: "Diseña un modelo OpenBIM para una vivienda moderna de 2 pisos"
    Note over AG: Analiza requerimientos, alturas Z, vanos y espesores
    AG-->>User: Genera docs/plans/YYYY-MM-DD-vivienda.md
    
    User->>Claude: Adjunta plan: "Ejecuta la Fase 1 en Blender Bonsai"
    Note over Claude: Adaptive Thinking (Cálculo vectorial + IfcOpenShell)
    Claude->>Blender: Llama a Blender MCP (Crea IfcProject, Niveles e IfcSlab)
    Blender-->>User: Visualización inmediata de la losa y niveles en pantalla
    Claude-->>User: "Fase 1 completada. Por favor revisa el Viewport y confirma para Fase 2."
    
    User->>Blender: Rota cámara e inspecciona jerarquía en panel Bonsai
    User->>Claude: "Aprobado, continúa con la Fase 2 (Muros perimetrales)"
    Note over Claude: Modela IfcWall con espesor 0.20m y altura 3.00m
    Claude->>Blender: Llama a Blender MCP (Instancia muros perimetrales)
    Blender-->>User: Muros levantados en 3D
    Claude-->>User: "Fase 2 lista. Checkpoint de revisión."
```

---

## 🏗️ OpenBIM Spatial Containment Hierarchy

A diferencia del modelado poligonal ciego, todos los elementos modelados por esta arquitectura respetan el estándar nativo de **BuildingSMART (IFC4)**:

```mermaid
graph TD
    Project["IfcProject: Proyecto_Residencial"] --> Site["IfcSite: Terreno_Principal"]
    Site --> Building["IfcBuilding: Edificio_A"]
    Building --> Storey0["IfcBuildingStorey: Nivel_00_PB (Z = 0.00m)"]
    Building --> Storey1["IfcBuildingStorey: Nivel_01_PA (Z = +3.00m)"]
    
    Storey0 --> Slab0["IfcSlab: Losa_Fundacion (e = 0.25m)"]
    Storey0 --> WallExt0["IfcWall: Muros_Perimetrales (e = 0.20m)"]
    Storey0 --> WallInt0["IfcWall: Tabiques_Interiores (e = 0.10m)"]
    WallExt0 --> Open0["IfcOpeningElement (Vano Puerta Principal)"]
    Open0 --> Door0["IfcDoor (0.90m x 2.10m)"]
    
    Storey1 --> Slab1["IfcSlab: Losa_Entrepiso (e = 0.20m)"]
    Storey1 --> WallExt1["IfcWall: Muros_Planta_Alta (e = 0.20m)"]
    Storey1 --> Roof["IfcRoof / IfcSlab: Cubierta (e = 0.20m)"]

    classDef ifc fill:#005596,stroke:#fff,stroke-width:2px,color:#fff;
    class Project,Site,Building,Storey0,Storey1,Slab0,WallExt0,WallInt0,Open0,Door0,Slab1,WallExt1,Roof ifc;
```

---

## 🚦 Phase State Machine & Review Checkpoints

```mermaid
stateDiagram-v2
    [*] --> Blueprint_Design: Antigravity analiza requerimientos
    Blueprint_Design --> Phase_1_Active: Genera docs/plans/*.md
    
    state Phase_1_Active {
        [*] --> Claude_Reasoning: Adaptive Thinking (Opus 5.5)
        Claude_Reasoning --> MCP_Execution: Llama a Blender MCP
        MCP_Execution --> Verify_Phase: Comprueba existencia de entidades IFC
    }
    
    Phase_1_Active --> Checkpoint_Pause: Checkpoint de revisión humana
    
    state Checkpoint_Pause {
        Review_Viewport: Usuario revisa en Blender 3D
        Check_Hierarchy: Usuario revisa árbol Bonsai
    }
    
    Checkpoint_Pause --> Phase_2_Active: Usuario aprueba en el chat
    Checkpoint_Pause --> Blueprint_Refine: Usuario pide cambios (Antigravity ajusta)
    Blueprint_Refine --> Phase_1_Active
    
    state Phase_2_Active {
        [*] --> Walls_Modeling: Modela Muros e Intersecciones
        Walls_Modeling --> Openings_Cuts: Aplica vanos y carpinterías
    }
    
    Phase_2_Active --> Checkpoint_2: Checkpoint Fase 2
    Checkpoint_2 --> Completed_BIM_Model: Fases completas
    Completed_BIM_Model --> [*]: Exportación IFC válida
```

---

## 📦 Skills Incluidas en este Paquete

| Skill | Entorno | Rol | Descripción |
| :--- | :--- | :--- | :--- |
| **`claude-planner`** | Antigravity (Gemini) | Arquitecto | Diseña blueprints paramétricos en `docs/plans/YYYY-MM-DD-<tarea>.md` optimizados para Claude Code y Desktop. |
| **`antigravity-executor`** | Claude Code (CLI) | Ejecutor Quirúrgico | Ejecuta tareas paso a paso, persiste el estado con `- [x]` en disco, pausa en checkpoints y recomienda `/clear`. |
| **`bonsai-bim-orchestrator`** | Antigravity & Claude | Especialista OpenBIM | Contiene las reglas IFC4, jerarquías de niveles, buenas prácticas de Bonsai y el módulo de referencia `bonsai-api-cheatsheet.py`. |

---

## 🚀 Instalación Rápida (1-Click en cualquier computador)

Clona el repositorio y ejecuta el instalador universal:

```bash
git clone https://github.com/zebas-hidalgo/antigravity-claude-bridge.git
cd antigravity-claude-bridge
chmod +x install.sh
./install.sh
```

### Lo que hace el instalador:
1. Instala `claude-planner` en `~/.gemini/config/skills/claude-planner/`.
2. Instala `antigravity-executor` en `~/.claude/skills/antigravity-executor/`.
3. Instala `bonsai-bim-orchestrator` y su cheatsheet en ambos entornos.
4. Vincula la regla automática en tu `~/.claude/CLAUDE.md`.

---

## ⚙️ Configuración para la App de Claude Desktop (GUI)

Si utilizas la **App de Claude Desktop** (sin terminal):

### 1. Conectar Blender MCP en Claude Desktop
Edita `~/Library/Application Support/Claude/claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "blender": {
      "command": "/Users/<TU_USUARIO>/.local/bin/uvx",
      "args": ["blender-mcp"]
    }
  }
}
```

### 2. Crear un Proyecto en Claude Desktop
1. Crea un proyecto llamado: `Bonsai OpenBIM Studio`.
2. En **Project Instructions**, pega el contenido de [`templates/claude-project-instructions.md`](templates/claude-project-instructions.md).
3. Selecciona:
   * **Modelo:** **Claude Opus 5.5**
   * **Pensamiento:** **Adaptive Thinking (Alto / Profundo)**

### 3. Conectar Blender
1. Abre Blender con el add-on de **Bonsai** y **Blender MCP**.
2. En la barra lateral (`N`), abre Blender MCP y haz clic en **"Start MCP Server"**.

---

## 🛡️ Protocolo de Diagnóstico y Recuperación de Errores

Si alguna operación de Blender o test falla tras 1 intento rápido de autocorrección, Claude se detiene inmediatamente y genera este bloque:

```markdown
### [ANTIGRAVITY DIAGNOSTIC REPORT]
- **Phase / Task Failed:** Fase 2 / Tarea 2.1
- **IFC Class / Objeto:** IfcWall / Wall_Exterior_01
- **Error Trace:** RuntimeError: Active IFC project not loaded in Bonsai
- **Suspected Cause:** El usuario abrió una escena nueva sin inicializar IfcProject
```

Pega este bloque en Antigravity y este ajustará el blueprint de inmediato sin quemar tokens de Claude en bucles de ensayo y error.

---

## 📄 Licencia
MIT © 2026 Sebastián Hidalgo
