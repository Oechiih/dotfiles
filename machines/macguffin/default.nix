{ ... }: {
  networking.computerName = "MacGuffin";
  networking.hostName     = "MacGuffin";
  system.primaryUser      = "joe";

  homebrew.casks = [
    "bambu-studio"
    "discord"
    "gimp"
    "ibkr"
    "royal-tsx"
    "tradingview"
  ];
  homebrew.masApps = {
    "1Password for Safari" = 1569813296;
    "Infuse" = 1136220934;
    "Mela"   = 1568924476;
    "Reeder" = 1529448980;
    "Wipr" = 1320666476;
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Zen.app"
    "/System/Applications/Mail.app"
    "/System/Applications/Messages.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Music.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Ghostty.app"
    "/Applications/1Password.app"
    "/Applications/Reeder.app"
    "/Applications/Mela.app"
    "/Applications/Royal TSX.app"
    "/Applications/Discord.app"
    "/Applications/IBKR Desktop.app"
    "/Applications/TradingView.app"
    "/Applications/Infuse.app"
    "/Applications/Bambu Studio.app"
  ];
}
