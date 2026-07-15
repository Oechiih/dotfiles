{ lib, ... }: {
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
    # TODO: replace with your actual work email
    programs.git.userEmail = lib.mkForce "TODO@company.com";
  };
}
