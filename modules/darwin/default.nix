{ pkgs, ... }: {
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shells = with pkgs; [ nushell ];

  environment.variables.XDG_CONFIG_HOME = "$HOME/.config";

  # nix-darwin doesn't add Homebrew's prefix to PATH on its own, and
  # home-manager now owns .zprofile so the old `eval "$(brew shellenv)"`
  # line is gone — without this, brew itself and every cask/formula binary
  # (e.g. pwsh) are invisible in a fresh shell.
  environment.systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];

  users.users.joe.home = "/Users/joe";

  security.pam.services.sudo_local.touchIdAuth = true;

  # Determinate Nix manages its own daemon; let it, instead of nix-darwin.
  nix.enable = false;

  # Avoid a logout/login cycle after rebuild — activation now runs as root,
  # so run this as the user it needs to affect.
  system.activationScripts.postActivation.text = ''
    sudo -u joe /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.stateVersion = 5;
}
