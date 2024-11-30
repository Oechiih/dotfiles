#!/usr/bin/env pwsh

# List of extensions
$extensions = @(
    "docsmsft.docs-markdown"
    "esbenp.prettier-vscode"
    "GitHub.github-vscode-theme"
    "yzhang.markdown-all-in-one"
    "bbenoist.nix"
)

foreach ($extension in $extensions) {
    Start-Process -NoNewWindow -Wait -FilePath code -ArgumentList ('--install-extension {0}' -f $extension)
}
