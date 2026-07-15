{ ... }: {
  system.primaryUser = "joe";

  homebrew.taps = [ "azure/functions" ];
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
    "/System/Applications/Mail.app"
    "/System/Applications/Messages.app"
    "/System/Applications/Calendar.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Ghostty.app"
    "/Applications/1Password.app"
    "/Applications/Microsoft Edge.app"
    "/Applications/Windows App.app"
  ];

  home-manager.users.joe = { ... }: {
    programs.git.userName  = "Jan Oehen";
    programs.git.userEmail = "TODO@company.com";
  };
}
