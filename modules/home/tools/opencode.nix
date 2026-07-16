{ ... }: {
  # opencode has no home-manager `programs.opencode` module (yet), so wire its
  # config in directly. Config lives at ~/.config/opencode per `opencode debug
  # paths`, consistent with xdg.enable elsewhere in this repo.
  xdg.configFile = {
    "opencode/opencode.json".source = ../../../config/opencode/opencode.json;
    "opencode/tui.json".source = ../../../config/opencode/tui.json;
    "opencode/package.json".source = ../../../config/opencode/package.json;
  };
}
