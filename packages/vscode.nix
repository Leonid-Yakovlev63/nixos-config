{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # Nix
      bbenoist.nix
      # Go
      golang.go
      # Web
      ritwickdey.liveserver
      formulahendry.auto-close-tag
    ];
  };
}
