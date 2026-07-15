{ ... }: {
  programs.nushell = {
    enable = true;
    configFile.source = ../../../config/nushell/config.nu;
    envFile.source = ../../../config/nushell/env.nu;
  };

  # Not managed by programs.nushell — placed alongside config.nu so the source command works
  home.file.".config/nushell/catppuccin-frappe.nu".source =
    ../../../config/nushell/catppuccin-frappe.nu;
}
