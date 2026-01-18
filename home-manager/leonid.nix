{ config, pkgs, ... }:

{
  home.username = "leonid";
  home.homeDirectory = "/home/leonid";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Must Have
    obsidian

    # Programming
    go
    gcc
    gnumake

    # Go tools
    gopls
    gotests
    impl
    delve
    go-tools

    # Terminal Apps
    fastfetch
    btop
    # GNOME
    gnomeExtensions.blur-my-shell
  ];

  # https://discourse.nixos.org/t/enabling-gnome-extensions-with-home-manager/59701
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
        ];
      };
      "org/gnome/desktop/interface".show-battery-percentage = true;
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "Leonid-Yakovlev63";
      userEmail = "j772115@gmail.com";
      extraConfig = {
        init.defaultBranch = "master";
        safe.directory = "/etc/nixos";
      };
      aliases = {
        s = "status";
        m = "merge --no-ff";
        # https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
        lg1 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
      };
    };
    vscode = {
      enable = true;
      userSettings = {
        "terminal.integrated.stickyScroll.enabled" = false;

        # Go settings
        "go.toolsManagement.autoUpdate" = false;
        "go.useLanguageServer" = true;
        "go.languageServer" = "gopls";
      };
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
  };
}
