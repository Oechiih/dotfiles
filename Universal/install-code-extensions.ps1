#!/usr/bin/env pwsh

# List of extensions
$extensions = @(
    "yzhang.markdown-all-in-one"
    "bbenoist.nix"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "esbenp.prettier-vscode"
    "github.copilot"
    "github.copilot-chat"
    "github.vscode-github-actions"
    "hashicorp.terraform"
    "ms-vscode.powershell"
    "thenuprojectcontributors.vscode-nushell-lang"
)


foreach ($extension in $extensions) {
    Start-Process -NoNewWindow -Wait -FilePath code -ArgumentList ('--install-extension {0}' -f $extension)
}
