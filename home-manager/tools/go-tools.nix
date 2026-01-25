{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go

    # Go tools
    gopls
    gotests
    impl
    delve
    go-tools
  ];
}
