{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    sd
    bash
    jq
    yq-go
  ];

  dev = [
    pls
    git
    doctl
  ];

  main = [
    doppler
    terraform
  ];

  lint = [
    # core
    treefmt

    # additional linters
    infisical
    terraform-docs
    tfsec
    tflint
  ];
}
