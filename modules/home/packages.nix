{ pkgs, ... }: {
  home.packages = with pkgs; [
    azure-cli
    carapace
    dockutil
    eza
    htop
    jq
    just
    kubectl
    lazygit
    mas
    nodejs
    terraform
    terraform-docs
    tflint
    yamllint
    yq-go
  ];
}
