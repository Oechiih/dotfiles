{ pkgs, ... }: {
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shells = with pkgs; [ nushell ];

  environment.variables.XDG_CONFIG_HOME = "$HOME/.config";

  users.users.joe.home = "/Users/joe";

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  # Avoid a logout/login cycle after rebuild
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.stateVersion = 5;
}
