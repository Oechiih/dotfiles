{ pkgs, ... }: {
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  networking.computerName = "MacGuffin";
  networking.hostName = "MacGuffin";

  environment.shells = with pkgs; [ nushell ];

  # Set XDG_CONFIG_HOME for shell sessions (zsh, bash)
  environment.variables.XDG_CONFIG_HOME = "$HOME/.config";

  # Set it in the launchd user session so nushell sees it when used as login shell
  launchd.user.agents."setenv-xdg-config-home" = {
    serviceConfig = {
      ProgramArguments = [
        "/bin/launchctl" "setenv" "XDG_CONFIG_HOME" "/Users/joe/.config"
      ];
      RunAtLoad = true;
    };
  };

  users.users.joe.home = "/Users/joe";

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  # Avoid a logout/login cycle after rebuild
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.stateVersion = 5;
}
