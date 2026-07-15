{ ... }: {
  home.file = {
    # Ghostty
    "Library/Application Support/com.mitchellh.ghostty/config".source =
      ../../config/ghostty/config;
    "Library/Application Support/com.mitchellh.ghostty/themes/catppuccin-frappe.conf".source =
      ../../config/ghostty/themes/catppuccin-frappe.conf;
    "Library/Application Support/com.mitchellh.ghostty/themes/catppuccin-latte.conf".source =
      ../../config/ghostty/themes/catppuccin-latte.conf;

    # VS Code settings
    "Library/Application Support/Code/User/settings.json".source =
      ../../config/vscode/settings.json;

    # htop — ~/.config/htop/htoprc
    ".config/htop/htoprc".source = ../../config/htop/htoprc;

    # opencode plugins
    ".config/opencode/package.json".source = ../../config/opencode/package.json;

    # PowerShell profile
    ".config/powershell/Microsoft.PowerShell_profile.ps1".source =
      ../../config/powershell/Microsoft.PowerShell_profile.ps1;
  };
}
