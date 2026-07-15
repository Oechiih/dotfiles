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

  security.pam.services.sudo_local.touchIdAuth = true;

  # Avoid a logout/login cycle after rebuild — activation now runs as root,
  # so run this as the user it needs to affect.
  system.activationScripts.postActivation.text = ''
    sudo -u joe /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.stateVersion = 5;
}
