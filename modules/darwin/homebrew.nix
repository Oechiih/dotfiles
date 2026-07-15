{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    taps = [
      "anomalyco/tap"
      "shaunsingh/sfmono-nerd-font-ligaturized"
    ];
    brews = [
      "container"
      "opencode"
      "pkl"
    ];
    casks = [
      "1password"
      "blockblock"
      "ghostty"
      "lulu"
      "powershell"
      "rectangle"
      "shaunsingh/sfmono-nerd-font-ligaturized/font-sf-mono-nerd-font-ligaturized"
      "visual-studio-code"
      "zen"
    ];
  };
}
