{ pkgs, atomi, pkgs-jul-24-23 }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          pls;
      }
    );
    jul-24-23 = (
      with pkgs-jul-24-23;
      {
        inherit
          coreutils
          sd
          bash
          jq
          yq-go

          # fmt
          treefmt

          # dev
          git

          # main
          terraform

          # lint
          terraform-docs
          infracost
          tfsec
          tflint
          ;
      }
    );
  };
in
with all;
atomipkgs //
jul-24-23
