{ lib, pkgs, ... }: {
  # Ghostty loads its base config from ~/Library/Application Support/ on
  # Darwin, but resolves custom `theme = ...` files specifically from
  # $XDG_CONFIG_HOME/ghostty/themes/ (~/.config/ghostty/themes/) regardless —
  # so the themes have to live there even though the config itself doesn't.
  xdg.configFile = {
    "ghostty/config".source = ../../config/ghostty/config;
    "ghostty/themes/catppuccin-frappe.conf".source =
      ../../config/ghostty/themes/catppuccin-frappe.conf;
    "ghostty/themes/catppuccin-latte.conf".source =
      ../../config/ghostty/themes/catppuccin-latte.conf;
  };

  home.file = lib.mkIf pkgs.stdenv.isDarwin {
    # VS Code settings
    "Library/Application Support/Code/User/settings.json".source =
      ../../config/vscode/settings.json;

    # htop — ~/.config/htop/htoprc
    ".config/htop/htoprc".source = ../../config/htop/htoprc;

    # PowerShell profile
    ".config/powershell/Microsoft.PowerShell_profile.ps1".source =
      ../../config/powershell/Microsoft.PowerShell_profile.ps1;
  };
}
