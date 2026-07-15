host := `hostname -s`

# Apply config
switch:
    darwin-rebuild switch --flake .#{{host}}

# Apply work Mac config (hostname is company-managed)
switch-work:
    darwin-rebuild switch --flake .#work-mac

# Apply NixOS config — hostname must match the flake key
switch-nixos:
    sudo nixos-rebuild switch --flake .#{{host}}

# Update all flake inputs then apply (personal Mac)
update:
    nix flake update
    darwin-rebuild switch --flake .#{{host}}

# Remove old Nix generations
gc:
    nix-collect-garbage -d

# Set nushell as login shell — run once after first switch
login-shell:
    chsh -s $(which nu)
