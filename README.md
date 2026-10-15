# Puente Colaborativo Antigravity <-> Claude <-> Blender Bonsai

> **Protocolo colaborativo multiagente y OpenBIM de última generación que une Google Antigravity (Arquitecto Estratégico de Alto Contexto), Anthropic Claude (Opus 5.5 / Sonnet como Ejecutor Quirúrgico y Modelador BIM) y Blender (Autoría OpenBIM nativa con Bonsai e IfcOpenShell).**

[![Licencia: MIT](https://img.shields.io/badge/Licencia-MIT-blue.svg)](LICENSE)
[![Estándar: OpenBIM IFC4](https://img.shields.io/badge/Estándar-OpenBIM%20IFC4-005596.svg)](https://www.buildingsmart.org/standards/bsi-standards/industry-foundation-classes/)
[![Compatibilidad: Blender 4.x](https://img.shields.io/badge/Blender-4.x%20%2B%20Bonsai-E87D0D.svg)](https://bonsaibim.org/)
[![Modelo Recomendado: Claude Opus 5.5](https://img.shields.io/badge/Recomendado-Claude%20Opus%205.5%20(Pensamiento%20Adaptativo)-7A52B3.svg)]()
[![Planificador: Gemini 2.5 / 3 Pro](https://img.shields.io/badge/Planificador-Gemini%202.5%20%2F%203%20Pro%20(Antigravity)-4285F4.svg)]()

---

## 🌟 Resumen Ejecutivo

Cuando los modelos de IA intentan programar o modelar en 3D de forma autónoma sin una división estratégica de funciones, se enfrentan a dos problemas críticos:
1. **Saturación y Costo de Contexto:** Claude gasta entre el 50% y el 70% de su presupuesto explorando archivos a ciegas, buscando en directorios o procesando salidas de consola saturadas de texto.
2. **Sobrecarga Cognitiva en Modelado 3D y BIM:** Forzar a un único prompt a calcular planos arquitectónicos, cotas métricas, normativas de construcción, geometría espacial y la sintaxis de la API de Blender provoca alucinaciones de escala, topología rota o mallas poligonales genéricas sin datos BIM.

### La División Triangular del Trabajo

```mermaid
flowchart TD
    subgraph Antigravity ["1. ANTIGRAVITY (El Arquitecto de Alto Contexto)"]
        A1["Gemini 2.5 / 3 Pro (Ventana de 1M a 2M de tokens)"]
        A2["Analiza repositorios, documentación y normativas"]
        A3["Diseña el programa espacial, cotas Z y vanos"]
        A4["Genera Blueprints por fases en docs/plans/"]
    end

    subgraph Claude ["2. CLAUDE DESKTOP / CODE (El Autor y Modelador BIM)"]
        B1["Claude Opus 5.5 con Pensamiento Adaptativo"]
        B2["Cero exploración a ciegas: lee el blueprint enfocado"]
        B3["Trigonometría precisa y llamadas a IfcOpenShell"]
        B4["Ejecuta herramientas mediante Blender MCP"]
    end

    subgraph Blender ["3. BLENDER + BONSAI (El Entorno OpenBIM Visual)"]
        C1["Add-on Bonsai (Motor IfcOpenShell nativo)"]
        C2["Crea entidades IFC reales (IfcWall, IfcSlab, IfcDoor)"]
        C3["Renderiza en tiempo real en el Viewport 3D"]
        C4["Mantiene el árbol espacial IFC estructurado"]
    end

    subgraph Reviewer ["4. INSPECTOR HUMANO (Tú)"]
        D1["Inspecciona el Viewport 3D y el panel de Bonsai"]
        D2["Aprueba o solicita ajustes en cada Checkpoint"]
    end

    Antigravity -->|Blueprint Paramétrico| Claude
    Claude -->|Llamadas MCP / bpy| Blender
    Blender -->|Feedback Visual Inmediato| Reviewer
    Reviewer -->|Aprobación de Fase| Claude
```

---

## 📊 Economía de Tokens: Por qué se Ahorra entre 70% y 85%

En Claude pagas por el acumulado de cada turno. Al utilizar a Antigravity como filtro arquitectónico y dividir la ejecución en fases con puntos de control (`/clear` o reinicio de contexto), se elimina el efecto bola de nieve:

| Métrica | Claude Autónomo (Solo) | Puente Triangular (Antigravity + Claude + Bonsai) | Impacto Real |
| :--- | :--- | :--- | :--- |
| **Contexto de Entrada (Lectura)** | 800.000 – 1.400.000 tokens *(re-enviando todo el proyecto en cada turno)* | 100.000 – 180.000 tokens *(únicamente el plan y los archivos de la fase)* | **~85% de ahorro** |
| **Ruido de Terminal y Logs** | 100.000 – 200.000 tokens *(trazas de error y consola completas)* | 15.000 – 25.000 tokens *(comprimido y filtrado por MCP/RTK)* | **~80% de ahorro** |
| **Tokens de Salida (Respuestas)** | 15.000 – 25.000 tokens *(explicaciones largas y cortesías innecesarias)* | 3.000 – 5.000 tokens *(ejecución directa de herramientas)* | **~75% de ahorro** |
| **Turnos de Ensayo y Error** | 12 a 20 turnos | 3 a 5 turnos atómicos | **~70% menos turnos** |
| **Costo por Modelo / Tarea** | **$4.00 – $8.00 USD** | **$0.40 – $0.90 USD** | **80% a 85% más económico** |

---

## 🔄 Flujo de Trabajo en Secuencia: De la Idea al Modelo OpenBIM

```mermaid
sequenceDiagram
    autonumber
    actor Usuario as Usuario (Inspector)
    participant AG as Antigravity (Gemini)
    participant Claude as Claude Desktop (Opus 5.5)
    participant Blender as Blender 3D (Bonsai MCP)

    Usuario->>AG: "Diseña un modelo OpenBIM para una vivienda de 2 plantas"
    Note over AG: Analiza requerimientos, cotas Z, vanos y jerarquía IFC
    AG-->>Usuario: Genera docs/plans/YYYY-MM-DD-vivienda.md
    
    Usuario->>Claude: Adjunta plan: "Ejecuta la Fase 1 en Blender Bonsai"
    Note over Claude: Pensamiento Adaptativo (Cálculo vectorial + IfcOpenShell)
    Claude->>Blender: Llama a Blender MCP (Crea IfcProject, Niveles e IfcSlab)
    Blender-->>Usuario: Visualización inmediata de la losa y niveles en pantalla
    Claude-->>Usuario: "Fase 1 completada. Por favor revisa el Viewport y confirma para Fase 2."
    
    Usuario->>Blender: Rota cámara e inspecciona jerarquía en panel Bonsai
    Usuario->>Claude: "Aprobado, continúa con la Fase 2 (Muros perimetrales)"
    Note over Claude: Modela IfcWall con espesor 0.20m y altura 3.00m
    Claude->>Blender: Llama a Blender MCP (Instancia muros perimetrales)
    Blender-->>Usuario: Muros levantados en 3D
    Claude-->>Usuario: "Fase 2 lista. Checkpoint de revisión."
```

---

## 🏗️ Jerarquía Espacial de Contención OpenBIM (IFC4)

A diferencia del modelado poligonal tradicional, los elementos generados por este sistema respetan el estándar nativo de **BuildingSMART (IFC4)**:

```mermaid
graph TD
    Project["IfcProject: Proyecto_Residencial"] --> Site["IfcSite: Terreno_Principal"]
    Site --> Building["IfcBuilding: Edificio_A"]
    Building --> Storey0["IfcBuildingStorey: Nivel_00_PB (Cota Z = 0.00m)"]
    Building --> Storey1["IfcBuildingStorey: Nivel_01_PA (Cota Z = +3.00m)"]
    
    Storey0 --> Slab0["IfcSlab: Losa_Fundacion (Espesor = 0.25m)"]
    Storey0 --> WallExt0["IfcWall: Muros_Perimetrales (Espesor = 0.20m)"]
    Storey0 --> WallInt0["IfcWall: Tabiques_Interiores (Espesor = 0.10m)"]
    WallExt0 --> Open0["IfcOpeningElement (Vano Puerta Principal)"]
    Open0 --> Door0["IfcDoor: Puerta_Acceso (0.90m x 2.10m)"]
    
    Storey1 --> Slab1["IfcSlab: Losa_Entrepiso (Espesor = 0.20m)"]
    Storey1 --> WallExt1["IfcWall: Muros_Planta_Alta (Espesor = 0.20m)"]
    Storey1 --> Roof["IfcRoof / IfcSlab: Cubierta (Espesor = 0.20m)"]

    classDef ifc fill:#005596,stroke:#fff,stroke-width:2px,color:#fff;
    class Project,Site,Building,Storey0,Storey1,Slab0,WallExt0,WallInt0,Open0,Door0,Slab1,WallExt1,Roof ifc;
```

---

## 🚦 Máquina de Estados de Fases y Checkpoints de Revisión

```mermaid
stateDiagram-v2
    [*] --> Diseño_del_Blueprint: Antigravity analiza requerimientos
    Diseño_del_Blueprint --> Fase_1_Activa: Genera docs/plans/*.md
    
    state Fase_1_Activa {
        [*] --> Razonamiento_Claude: Pensamiento Adaptativo (Opus 5.5)
        Razonamiento_Claude --> Ejecucion_MCP: Llama a Blender MCP
        Ejecucion_MCP --> Verificacion_Fase: Comprueba entidades IFC en la escena
    }
    
    Fase_1_Activa --> Checkpoint_Pausa: Checkpoint de revisión humana
    
    state Checkpoint_Pausa {
        Inspeccion_Viewport: El usuario revisa en Blender 3D
        Revision_Jerarquia: El usuario revisa el árbol de Bonsai
    }
    
    Checkpoint_Pausa --> Fase_2_Activa: El usuario aprueba en el chat
    Checkpoint_Pausa --> Ajuste_del_Blueprint: El usuario solicita cambios (Antigravity ajusta)
    Ajuste_del_Blueprint --> Fase_1_Activa
    
    state Fase_2_Activa {
        [*] --> Modelado_Muros: Modela Muros e Intersecciones
        Modelado_Muros --> Perforacion_Vanos: Inserta vanos, puertas y ventanas
    }
    
    Fase_2_Activa --> Checkpoint_2: Checkpoint Fase 2
    Checkpoint_2 --> Modelo_BIM_Completado: Fases completas
    Modelo_BIM_Completado --> [*]: Exportación IFC nativa y válida
```

---

## 📦 Skills Incluidas en este Repositorio

| Skill | Entorno | Rol | Descripción |
| :--- | :--- | :--- | :--- |
| **`claude-planner`** | Antigravity (Gemini) | Arquitecto Planificador | Genera blueprints paramétricos en `docs/plans/YYYY-MM-DD-<tarea>.md` estructurados por fases y con comandos de verificación. |
| **`antigravity-executor`** | Claude Code (CLI) | Ejecutor Quirúrgico | Ejecuta tareas una a una, marca `- [x]` en disco, se detiene en los checkpoints y sugiere `/clear` para resetear tokens. |
| **`bonsai-bim-orchestrator`** | Antigravity y Claude | Especialista OpenBIM | Contiene las directivas de IFC4, jerarquías de niveles, reglas de Bonsai y el módulo de referencia Python `bonsai-api-cheatsheet.py`. |

---

## 🚀 Instalación Rápida (1 Clic en cualquier computador)

Clona el repositorio en cualquier máquina y ejecuta el instalador universal:

```bash
git clone https://github.com/zebas-hidalgo/antigravity-claude-bridge.git
cd antigravity-claude-bridge
chmod +x install.sh
./install.sh
```

### Lo que realiza el instalador de forma automática:
1. Instala `claude-planner` en `~/.gemini/config/skills/claude-planner/`.
2. Instala `antigravity-executor` en `~/.claude/skills/antigravity-executor/`.
3. Instala `bonsai-bim-orchestrator` y su cheatsheet en ambos entornos.
4. Vincula la regla automática en tu `~/.claude/CLAUDE.md`.

---

## ⚙️ Configuración para la App de Claude Desktop (Interfaz Gráfica)

Si utilizas la **App de Claude Desktop** en tu computador:

### 1. Conectar Blender MCP en Claude Desktop
Edita el archivo de configuración de Claude Desktop ubicado en:  
`~/Library/Application Support/Claude/claude_desktop_config.json`

Añade la sección `"mcpServers"` para Blender:

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
1. En la App de Claude Desktop, ve a la sección **Projects** (Proyectos) y crea uno llamado:  
   `Bonsai OpenBIM Studio`.
2. En **Project Instructions** (Instrucciones personalizadas del proyecto), copia y pega el contenido de [`templates/claude-project-instructions.md`](templates/claude-project-instructions.md).
3. Configura el modelo:
   * **Modelo:** **Claude Opus 5.5**
   * **Esfuerzo de pensamiento:** **Adaptive Thinking (Alto / Profundo)**

### 3. Conectar Blender en Vivo
1. Abre Blender con el add-on de **Bonsai** y **Blender MCP** activados.
2. En la barra lateral del Viewport 3D (`tecla N`), abre la pestaña de Blender MCP y haz clic en **"Start MCP Server"**.
3. Abre Claude Desktop: verás el icono del martillo (🔨) indicando que las herramientas de Blender están listas para usarse.

---

## 🎨 Ciclo de Trabajo Paso a Paso

### 1. Antigravity genera el blueprint
Le pides a Antigravity:
> *"Diseña un plan OpenBIM para un pabellón modular con Bonsai en `docs/plans/2026-10-15-pabellon.md`"*

Antigravity activa `claude-planner` y `bonsai-bim-orchestrator`, generando las fases paramétricas con cotas $Z$, espesores y jerarquía IFC.

### 2. Ejecución en Claude Desktop
1. Abres un chat en tu proyecto `Bonsai OpenBIM Studio` en Claude Desktop.
2. Arrastras el archivo `docs/plans/2026-10-15-pabellon.md` al chat.
3. Escribes:  
   > *"Por favor ejecuta la Fase 1 del plan en Blender Bonsai."*

### 3. Claude Opus 5.5 modela en directo
* Claude activa su pensamiento profundo, planifica la llamada a `ifcopenshell.api` y ejecuta el comando a través de Blender MCP.
* Verás crearse en tiempo real los niveles y la losa en tu ventana de Blender abierta.
* Claude se detiene en el checkpoint y te solicita revisión.

### 4. Revisión visual humana
* Inspeccionas el modelo en el Viewport 3D de Blender.
* Si todo es correcto, respondes en el chat:  
  > *"Aprobado, continúa con la Fase 2 (Muros)."*

---

## 🛡️ Protocolo de Diagnóstico y Recuperación de Errores

Si alguna operación de Blender o validación de IfcOpenShell falla tras 1 intento rápido de autocorrección, Claude se detiene inmediatamente y emite este bloque de diagnóstico:

```markdown
### [REPORTE DIAGNÓSTICO PARA ANTIGRAVITY]
- **Fase / Tarea Fallida:** Fase 2 / Tarea 2.1
- **Clase IFC / Entidad:** IfcWall / Wall_Exterior_01
- **Traza del Error:** RuntimeError: Active IFC project not loaded in Bonsai
- **Causa Sospechada:** Se abrió una escena limpia sin inicializar IfcProject
```

Copias este bloque en Antigravity y este ajusta el blueprint de inmediato sin que gastes tokens de Claude en bucles de ensayo y error.

---

## 📄 Licencia
Distribuido bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.  
Copyright (c) 2026 Sebastián Hidalgo
