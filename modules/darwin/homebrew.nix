{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    # Homebrew now refuses to load formulae/casks from third-party taps
    # unless explicitly trusted; `trusted = true` embeds `trusted: true` in
    # the tap's Brewfile entry so `brew bundle` trusts it on first use.
    taps = [
      { name = "anomalyco/tap"; trusted = true; }
      { name = "shaunsingh/sfmono-nerd-font-ligaturized"; trusted = true; }
    ];
    brews = [
      "container"
      "opencode"
      "pkl"
    ];
    casks = [
      "1password"
      "bettermouse"
      "blockblock"
      "ghostty"
      "lulu"
      "powershell@preview"
      "rectangle"
      "shaunsingh/sfmono-nerd-font-ligaturized/font-sf-mono-nerd-font-ligaturized"
      "visual-studio-code"
      "zen"
    ];
  };
}
