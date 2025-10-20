## Quick Context

- This repository is a single Processing sketch (Java-mode) located at `main.pde`.
- Processing version used in the workspace: 4.3 (the VS Code task calls `processing-4.3/processing-java.exe`).
- Entry points: `setup()` initializes canvas and `draw()` runs every frame. Example in this project:
  - `setup()` calls `size(200, 200)`
  - `draw()` renders an `ellipse(100, 100, 50, 50)`

## What an AI assistant should know

- Treat this as a Processing sketch (not a typical Java project). Files with `.pde` are concatenated by the Processing preprocessor; global variables and functions are valid across tabs.
- The program is driven by Processing lifecycle functions: `setup()`, `draw()`, `mousePressed()`, `keyPressed()` etc. Look for these as change points.
- There are currently no asset folders or external resources in the tree. If adding assets (images, fonts), place them in a `data/` directory at the sketch root.

## How to run (developer workflows)

- From VS Code: the workspace includes a task labelled "Run" which invokes the Processing CLI. It runs:
  - `C:\Users\obcor\Downloads\processing-4.3-windows-x64\processing-4.3\processing-java.exe --force --sketch=${fileDirname} --run`
  - In PowerShell you can run the same command (substitute your sketch folder path):
    & "C:\path\to\processing-4.3\processing-java.exe" --force --sketch "C:\full\path\to\command_game" --run
- From the Processing IDE: open the folder containing `main.pde` and press Run.

## Project-specific conventions and patterns

- Single-file sketch: `main.pde` is the canonical place for quick edits. For larger code, create additional `.pde` tabs (Processing concatenates them).
- Coordinate system is standard Processing (origin at top-left). The current drawing centers an ellipse at 100,100 on a 200×200 canvas. When modifying visuals, pay attention to `size()` and coordinate math.
- Use `println()` for debug logging — Processing prints to the IDE/console launched by `processing-java`.

## Integration points & external commands

- The only external integration is the Processing CLI (`processing-java.exe`). Use it for automated runs in CI or custom scripts.
- No external libraries or Java dependencies are checked in. If a library is required, add it via a `libraries/` folder in the sketch root or document installation steps in README.

## Examples of small edits an AI can make safely

- Change canvas size: update `size(200, 200)` in `setup()`.
- Modify the shape: change `ellipse(100, 100, 50, 50)` to other shapes or sizes.
- Add input handlers: implement `mousePressed()` or `keyPressed()` to make the sketch interactive.

## Pull request guidance for automated agents

- Keep changes minimal and visually demonstrable. Include a short screenshot or GIF in the PR description when it affects visuals.
- If adding files, keep the sketch folder structure flat and place resources in `data/`.

## Useful file references

- `main.pde` — the whole sketch and best source of truth for behavior.
- `.vscode/tasks.json` (workspace task labelled "Run") — shows how the sketch is executed via `processing-java`.

If anything here is unclear or you want more detail (CI steps, adding libraries, or an example interactive feature), tell me what to expand and I will iterate.
