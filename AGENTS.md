# AGENTS.md

## Project overview

Monixes is a lightweight Nix flake that provides reusable configuration
wrappers for NixOS and Home Manager. The flake exports:

- `nixosModules.default`
- `homeManagerModules.default`

NixOS modules live under `modules/nixos/` and are grouped by system concern.
Home Manager modules live under `modules/home-manager/`. Keep configuration
options under the established namespaces:

- `monixes.system.*` for NixOS/system configuration
- `monixes.home.*` for Home Manager/user configuration

Detailed user documentation belongs in the separate Monixes wiki repository.
Keep this repository's README focused on project identity and architecture.

## Required workflow

Before changing files:

1. Inspect the relevant modules, imports, README architecture, Git status, and
   recent history.
2. Explain the proposed approach, affected files, and any assumptions.
3. Ask the user for approval before implementing the change.

Do not begin implementation when the requested behavior is materially
ambiguous. Ask a focused clarification question instead.

During implementation:

- Prefer the smallest change that satisfies the request.
- Preserve existing public option names and behavior unless a breaking change
  is explicitly requested.
- Keep related modules, imports, option declarations, and README architecture
  consistent.
- Use valid NixOS and Home Manager module options; verify unfamiliar options
  against their upstream documentation.
- Do not add detailed feature documentation to this README; put it in the wiki
  repository instead.

## Validation

After changes:

- Run `git diff --check`.
- Parse all Nix files with `nix-instantiate --parse` when available.
- Run `nix flake check --no-build` when the environment permits it.
- Report any validation that could not run and why.

## Git and commits

- Make atomic commits: one feature, fix, refactor, or documentation change per
  commit.
- Do not mix unrelated cleanup into a feature commit.
- Use concise imperative commit messages, for example:
  - `Add unified theme system`
  - `Fix boot parameter handling`
  - `Update project architecture`
- Review the staged diff before committing.
- Never rewrite history, reset, or discard user changes without explicit
  approval.
- Do not commit or push unless the user requests it.
- When pushing is requested, confirm the target branch and push only the
  intended commits.

## Design direction

Monixes currently uses Catppuccin as its theme backend, exposed through the
unified `monixes.system.theme` and `monixes.home.theme` interfaces. Keep that
backend replaceable so a future custom theme flake can become the default
without forcing users to change those Monixes option names.
