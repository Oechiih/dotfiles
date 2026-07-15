{ ... }: {
  system.primaryUser = "joe";

  # Work Mac hostname is company-managed — not set here.
  # Apply with: just switch-work

  homebrew.casks = [
    # TODO: add work-specific casks
    "discord"
  ];
  homebrew.masApps = {
    # TODO: add work-specific MAS apps
  };

  system.defaults.dock.persistent-apps = [
    # TODO: set work dock order
    "/Applications/Zen.app"
    "/System/Applications/Mail.app"
    "/System/Applications/Messages.app"
    "/System/Applications/Calendar.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Ghostty.app"
    "/Applications/1Password.app"
    "/Applications/Discord.app"
  ];

  home-manager.users.joe = { ... }: {
    programs.git.userName  = "Jan Oehen";
    programs.git.userEmail = "TODO@company.com";
  };
}
