{ ... }: {
  # programs.nushell targets ~/.config/nushell/ which nushell ignores on macOS.
  # Use home.file to place configs at the correct macOS path directly.
  home.file = {
    "Library/Application Support/nushell/config.nu".source = ../../../config/nushell/config.nu;
    "Library/Application Support/nushell/env.nu".source = ../../../config/nushell/env.nu;
    "Library/Application Support/nushell/catppuccin-frappe.nu".source = ../../../config/nushell/catppuccin-frappe.nu;
  };
}
