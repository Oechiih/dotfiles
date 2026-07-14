# Dotfiles TODO

## Bugs to fix

- [x] `.macos` line 26: `AppleInterfaceStyleSwitchesAutomatically` set twice — second line should be `AppleWindowTabbingMode -string "always"`
- [x] `.gitconfig` missing `core.excludesfile` — global gitignore at `macOS/.gitignore` is never applied
- [x] `.DS_Store` committed to root — `git rm --cached .DS_Store`

## Missing infrastructure

- [ ] Write `install.sh` bootstrap script — symlinks all tracked files to their target paths (deferred)
- [x] `.zsh` incomplete — add history settings, common aliases, PATH additions
- [x] `.gitconfig` very bare — added `push.default`, `pull.rebase`, `init.defaultBranch`, `core.editor`, aliases

## Missing configs (capture before wiping machine)

- [x] Ghostty config — captured to `Universal/ghostty/`
- [x] Nushell config — full config built in `Universal/nushell/`
- [x] Shell prompt — configured for zsh, nushell, and pwsh

## Cleanup

- [x] Remove `install-code-extensions.ps1` — redundant with `vscode` entries in Brewfile, and out of sync
- [x] `Brewfile.lock.json` — gitignored and untracked
- [x] Rename `.powershell` → `Microsoft.PowerShell_profile.ps1` for clarity
- [x] Rename `macOS/.ssh` → `macOS/ssh/config` to make target path obvious
- [x] VS Code theme inconsistency — now Catppuccin Frappé everywhere
- [x] Remove commented-out dead settings in `.macos` (Safari DNT, battery %)
