{ ... }: {
  programs.git = {
    enable = true;
    userName = "Jan Oehen";
    userEmail = "10827844+Oechiih@users.noreply.github.com";
    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
    ];
    extraConfig = {
      fetch.prune = true;
      push.default = "current";
      pull.rebase = true;
      init.defaultBranch = "main";
      log.date = "format:%d %b %y";
      core.editor = "code --wait";
    };
    aliases = {
      lg = "log --oneline --graph --decorate --all";
      st = "status -sb";
    };
  };
}
