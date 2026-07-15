{ pkgs, ... }: {
  home.packages = with pkgs; [
    azure-cli
    carapace
    eza
    htop
    jq
    just
    kubectl
    mas
    nodejs
    terraform
    terraform-docs
    tflint
    yamllint
    yq-go
  ];
}
