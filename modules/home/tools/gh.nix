{ ... }: {
  programs.gh = {
    enable = true;
    settings = {
      version = 1;
      git_protocol = "ssh";
      editor = "code --wait";
      prompt = "enabled";
    };
  };
}
