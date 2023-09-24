{ pkgs, atomi, atomi_classic, pkgs-sep-20-23 }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          infisical
          pls;
      }
    );
    atomipkgs_classic = (
      with atomi_classic;
      {
        inherit
          sg;
      }
    );
    sep-20-23 = (
      with pkgs-sep-20-23;
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
          gitlint
          shellcheck
          terraform-docs
          tfsec
          tflint
          ;
      }
    );
  };
in
with all;
atomipkgs //
atomipkgs_classic //
sep-20-23
