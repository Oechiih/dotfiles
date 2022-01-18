#!/usr/bin/env pwsh

# List of extensions
$extensions = @(
    "docsmsft.docs-markdown"
    "esbenp.prettier-vscode"
    "GitHub.github-vscode-theme"
    "golang.go"
    "hashicorp.terraform"
    "mechatroner.rainbow-csv"
    "ms-azuretools.vscode-azureresourcegroups"
    "ms-azuretools.vscode-azurestaticwebapps"
    "ms-azuretools.vscode-azurestorage"
    "ms-azuretools.vscode-bicep"
    "ms-azuretools.vscode-docker"
    "ms-dotnettools.vscode-dotnet-runtime"
    "ms-vscode-remote.remote-containers"
    "ms-vscode.azure-account"
    "ms-vscode.powershell"
    "ms-vsliveshare.vsliveshare"
    "yzhang.markdown-all-in-one"
)

foreach ($extension in $extensions) {
    Start-Process -NoNewWindow -Wait -FilePath code -ArgumentList ('--install-extension {0}' -f $extension)
}
