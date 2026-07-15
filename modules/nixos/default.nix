{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.joe = {
    isNormalUser = true;
    home         = "/home/joe";
    extraGroups  = [ "wheel" ];
    shell        = pkgs.nushell;
  };

  system.stateVersion = "24.11";
}
