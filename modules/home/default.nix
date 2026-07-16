{ pkgs, ... }: {
  imports = [
    ./packages.nix
    ./git.nix
    ./ssh.nix
    ./shell/zsh.nix
    ./shell/nushell.nix
    ./tools/lazygit.nix
    ./tools/gh.nix
    ./tools/vscode.nix
    ./tools/opencode.nix
    ./files.nix
  ];

  home = {
    username = "joe";
    homeDirectory = "/Users/joe";
    stateVersion = "24.11";
  };

  # nix-darwin exports XDG_CONFIG_HOME=$HOME/.config system-wide, so
  # XDG-aware binaries (lazygit, etc.) look there at runtime. Without this,
  # home-manager's Darwin-conditional modules instead write their managed
  # config to ~/Library/Application Support/..., which those binaries never
  # read — the file gets created but silently ignored.
  xdg.enable = true;

  programs.home-manager.enable = true;
}
