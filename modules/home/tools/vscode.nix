{ lib, pkgs, ... }: lib.mkIf pkgs.stdenv.isDarwin {
  home.activation.vscodeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
    if [[ -x "$code" ]]; then
      for ext in \
        "catppuccin.catppuccin-vsc" \
        "catppuccin.catppuccin-vsc-icons" \
        "esbenp.prettier-vscode" \
        "hashicorp.terraform" \
        "marp-team.marp-vscode" \
        "ms-vscode.powershell" \
        "redhat.vscode-yaml" \
        "skellock.just" \
        "svelte.svelte-vscode" \
        "thenuprojectcontributors.vscode-nushell-lang" \
        "yzhang.markdown-all-in-one" \
      ; do
        $DRY_RUN_CMD "$code" --install-extension "$ext"
      done
    fi
  '';
}
