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
  ];

  main = [
    terraform
  ];

  lint = [
    # core
    treefmt

    # additional linters
    terraform-docs
    infracost
    tfsec
    tflint
  ];
}
