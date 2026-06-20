using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module PSReadline

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 400

Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key 'Ctrl+g' -ScriptBlock {lazygit}

# The built-in word movement uses character delimiters, but token based word
# movement is also very useful - these are the bindings you'd use if you
# prefer the token based movements bound to the normal emacs word movement
# key bindings.
Set-PSReadLineKeyHandler -Key Ctrl+Shift+LeftArrow -Function SelectShellBackwardWord
Set-PSReadLineKeyHandler -Key Ctrl+Shift+RightArrow -Function SelectShellForwardWord

#Enable carapace completion
$env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression

if (-not $IsWindows) {
    Set-Alias -Name clip -Value Set-Clipboard
    $env:PATH += ':/opt/homebrew/bin'
}

function prompt {
    $color = $? ? 'Blue' : 'Red'
    $git = git branch --show-current
    Write-Host '  ' -ForegroundColor Blue -NoNewLine
    Write-Host "$($executionContext.SessionState.Path.CurrentLocation)" -NoNewLine
    if($git){
        Write-Host '    ' -ForegroundColor Blue -NoNewLine
        Write-Host $git -ForegroundColor Green -NoNewLine
    }
    Write-Host ''
    Write-Host ' ' -ForegroundColor $color -NoNewLine
    return " "
}

# Enable zoxide (apparently this has to be at the end of the profile)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
