{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    taps = [
      "anomalyco/tap"
      "shaunsingh/sfmono-nerd-font-ligaturized"
    ];
    # CLI tools not yet in nixpkgs
    brews = [
      "container"
      "opencode"
      "pkl"
    ];
    casks = [
      "1password"
      "bambu-studio"
      "bettermouse"
      "blockblock"
      "discord"
      "ghostty"
      "gimp"
      "ibkr"
      "lulu"
      "powershell"
      "rectangle"
      "royal-tsx"
      "shaunsingh/sfmono-nerd-font-ligaturized/font-sf-mono-nerd-font-ligaturized"
      "tradingview"
      "visual-studio-code"
      "zen"
    ];
    masApps = {
      "1Password for Safari" = 1569813296;
      "Infuse" = 1136220934;
      "Mela" = 1568924476;
      "Reeder" = 1529448980;
      "Wipr" = 1320666476;
    };
  };
}
