hostname := "MacGuffin"

# Apply configuration
switch:
    darwin-rebuild switch --flake .#{{hostname}}

# Update all flake inputs then apply
update:
    nix flake update
    darwin-rebuild switch --flake .#{{hostname}}

# Remove old Nix generations
gc:
    nix-collect-garbage -d

# Set nushell as login shell — run once after first switch
login-shell:
    chsh -s $(which nu)
