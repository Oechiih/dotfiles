{ lib, ... }: {
  system.primaryUser = "joe";

  homebrew.taps = [ { name = "azure/functions"; trusted = true; } ];
  homebrew.brews = [
    "azure/functions/azure-functions-core-tools@4"
  ];
  homebrew.casks = [
    "bitwarden"
    "microsoft-edge"
    "windows-app"
  ];

  system.defaults.dock.persistent-apps = [
    "/Applications/Zen.app"
    "/Applications/Microsoft Edge.app"
    "/Applications/Microsoft Teams.app"
    "/Applications/Microsoft Outlook.app"
    "/System/Applications/Music.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Ghostty.app"
    "/Applications/Bitwarden.app"
    "/Applications/1Password.app"
    "/Applications/Windows App.app"
  ];

  home-manager.users.joe = { ... }: {
    programs.git.userName  = "Jan Oehen";
    # TODO: replace with your actual work email — this is the default
    # identity; oechiih (personal) repos override it below.
    programs.git.userEmail = lib.mkForce "TODO@company.com";

    # Personal (github.com/oechiih) repos get your personal identity,
    # matched by remote URL so it applies regardless of clone location.
    # Bracket classes cover both "oechiih" and "Oechiih" casing.
    programs.git.includes = [
      {
        condition = "hasconfig:remote.*.url:git@github.com:[Oo]echiih/**";
        contents = {
          user.name = "Jan Oehen";
          user.email = "10827844+Oechiih@users.noreply.github.com";
        };
      }
      {
        condition = "hasconfig:remote.*.url:https://github.com/[Oo]echiih/**";
        contents = {
          user.name = "Jan Oehen";
          user.email = "10827844+Oechiih@users.noreply.github.com";
        };
      }
    ];

    # Silently route SSH oechiih remotes through a dedicated Host alias so
    # they pick up the matchBlock below, without needing to rewrite remotes
    # by hand.
    programs.git.extraConfig.url."git@github.com-oechiih:".insteadOf = [
      "git@github.com:oechiih/"
      "git@github.com:Oechiih/"
    ];

    # Work Mac override: only oechiih (personal) GitHub SSH traffic goes
    # through 1Password's agent; every other host falls back to the system
    # default (ssh-agent / company-provided keys), unlike the shared
    # ssh.nix default which points everything at 1Password.
    programs.ssh.matchBlocks = lib.mkForce {
      "github.com-oechiih" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
        identityAgent = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      };
    };
  };
}
