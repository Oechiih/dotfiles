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
    programs.git.settings.user.name  = "Jan Oehen";
    # TODO: replace with your actual work email — this is the default
    # identity; oechiih (personal) repos override it below.
    programs.git.settings.user.email = lib.mkForce "TODO@company.com";

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
    # by hand. The org segment must be repeated in the replacement prefix —
    # insteadOf substitutes the whole matched prefix, it doesn't preserve
    # the part it matched.
    programs.git.settings.url."git@github.com-oechiih:Oechiih/".insteadOf = [
      "git@github.com:oechiih/"
      "git@github.com:Oechiih/"
    ];

    # Work Mac override: only oechiih (personal) GitHub SSH traffic goes
    # through 1Password's agent; every other host falls back to the system
    # default (ssh-agent / company-provided keys), unlike the shared
    # ssh.nix default which points everything at 1Password.
    programs.ssh.settings = lib.mkForce {
      "github.com-oechiih" = {
        hostname = "github.com";
        user = "git";
        # No identitiesOnly here: it restricts ssh to local ~/.ssh/id_*
        # files (or explicit IdentityFile entries), excluding anything the
        # agent offers that doesn't match — since there's no local key file
        # at all (1Password's agent is the only source), that left zero
        # identities to try and every auth attempt failed silently.
        identityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
    };
  };
}
