# Homebrew (for non-login shells)
if ('/opt/homebrew/bin' | path exists) {
  $env.PATH = ($env.PATH | prepend '/opt/homebrew/sbin' | prepend '/opt/homebrew/bin')
}

# Carapace — generate init file for config.nu to source
# https://carapace-sh.github.io/carapace-bin/setup/nushell.html
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# Zoxide — generate init file for config.nu to source
# https://github.com/ajeetdsouza/zoxide#nushell
zoxide init nushell | save -f ~/.zoxide.nu
