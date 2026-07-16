{ ... }: {
  programs.git = {
    enable = true;
    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
    ];
    settings = {
      user.name = "Jan Oehen";
      user.email = "10827844+Oechiih@users.noreply.github.com";
      fetch.prune = true;
      push.default = "current";
      pull.rebase = true;
      init.defaultBranch = "main";
      log.date = "format:%d %b %y";
      core.editor = "code --wait";
      alias = {
        lg = "log --oneline --graph --decorate --all";
        st = "status -sb";
      };
    };
  };
}
