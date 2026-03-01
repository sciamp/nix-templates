# nix-templates

Personal project templates for NixOS + Neovim.

## Templates

| Template | Description |
|---|---|
| `node-ts` | Node.js + TypeScript, npm |
| `node-ts-monorepo` | Node.js + TypeScript, pnpm workspaces |

## Usage

```bash
# Use a template in a new project
mkdir my-project && cd my-project
nix flake init -t github:sciamp/nix-templates#node-ts
direnv allow
```

Or add a shell alias to your NixOS config / shell rc:

```bash
new-ts() {
  mkdir "$1" && cd "$1"
  nix flake init -t github:sciamp/nix-templates#node-ts
  direnv allow
}

new-mono() {
  mkdir "$1" && cd "$1"
  nix flake init -t github:sciamp/nix-templates#node-ts-monorepo
  direnv allow
}
```

Then: `new-ts my-project` or `new-mono my-monorepo`.

## How it works

1. `shell.nix` / `flake.nix` — provides Node.js, TypeScript, and all LSP binaries via Nix
2. `.envrc` — direnv activates the Nix shell automatically on `cd`
3. `.nvim.lua` — Neovim picks this up (via `vim.opt.exrc = true`) and configures LSP only for this project

## NixOS requirements

Make sure these are enabled in your `configuration.nix`:

```nix
programs.direnv.enable = true;
programs.direnv.nix-direnv.enable = true;
```

And in your Neovim `init.lua`:

```lua
vim.opt.exrc = true  -- Neovim 0.9+ will prompt you to trust .nvim.lua on first open
```
