# Dotfiles

Personal machine configuration for macOS, managed with **nix-darwin** + **home-manager**.

## Package management philosophy

This repo uses a hybrid approach split on security properties:

### Nix — CLI tools and dotfiles

Nix manages CLI tools, shell environment, and dotfiles via nix-darwin and home-manager. `/nix/store` is root-owned and immutable — a rogue user-space process cannot modify installed binaries, eliminating the class of attack where tools like `git` or `terraform` get overwritten.

### Homebrew — GUI applications only

Homebrew manages GUI applications (casks) and Mac App Store apps (via `mas`). For casks, Homebrew is a thin wrapper around the vendor's signed and notarised `.app` — the trust boundary is Apple's notarisation system, not Homebrew itself. The weaker Homebrew security model matters far less here since the package manager is not in the trust chain.

### Mac App Store

Where available, MAS apps are preferred over casks — they are sandboxed and Apple-reviewed.

## Structure

```
dotfiles/
├── flake.nix                  # Entry point — defines darwinConfiguration
├── modules/
│   ├── darwin/
│   │   ├── default.nix        # nix-darwin entry point (Nix daemon, PAM, stateVersion)
│   │   ├── system.nix         # macOS defaults (replaces .macos script)
│   │   └── homebrew.nix       # GUI casks + MAS apps
│   └── home/
│       ├── default.nix        # home-manager entry point
│       ├── packages.nix       # CLI tools
│       ├── git.nix            # programs.git
│       ├── ssh.nix            # programs.ssh (1Password agent)
│       ├── files.nix          # home.file entries (ghostty, vscode, zen, etc.)
│       ├── shell/
│       │   ├── zsh.nix        # programs.zsh + fzf + zoxide
│       │   └── nushell.nix    # home.file for macOS nushell paths
│       └── tools/
│           ├── lazygit.nix    # programs.lazygit (Catppuccin Frappé)
│           └── gh.nix         # programs.gh
└── config/                    # Raw config files referenced by home-manager
    ├── ghostty/
    ├── nushell/
    ├── vscode/
    ├── zen/
    ├── htop/
    ├── opencode/
    └── powershell/
```

## Fresh machine setup

### 1. Install Nix

Use the Determinate Systems installer — flakes are enabled by default and macOS support is better:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### 2. Clone this repo

```bash
git clone <repo-url> ~/Documents/git/dotfiles
cd ~/Documents/git/dotfiles
```

### 3. Apply the configuration

```bash
nix run nix-darwin -- switch --flake .#MacGuffin
```

On subsequent rebuilds:

```bash
darwin-rebuild switch --flake .#MacGuffin
```

### 4. Zen browser

The `user.js` in `config/zen/` needs to be copied into the active Zen profile. The profile path has a random component:

```bash
cp config/zen/user.js ~/Library/Application\ Support/zen/Profiles/*.Default\ \(release\)/user.js
```

## Notes

- `flake.lock` is gitignored — commit it if you want fully pinned builds
- `opencode/node_modules/` is gitignored; run `bun install` in `config/opencode/` after setup
- Night Shift schedule cannot be scripted — set manually in System Settings → Displays → Night Shift
