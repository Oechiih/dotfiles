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
    ./files.nix
  ];

  home = {
    username = "joe";
    homeDirectory = "/Users/joe";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
