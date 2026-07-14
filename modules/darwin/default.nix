{ pkgs, ... }: {
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.joe.home = "/Users/joe";

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  # Avoid a logout/login cycle after rebuild
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.stateVersion = 5;
}
