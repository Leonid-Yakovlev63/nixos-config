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
    gnomeExtensions.dash-to-dock
    gnomeExtensions.compiz-windows-effect
  ];

  dconf = {
    enable = true;
    settings = {
      # https://discourse.nixos.org/t/enabling-gnome-extensions-with-home-manager/59701
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "dash-to-dock@charlesg99"
          "compiz-windows-effect@hermes83"
        ];
      };
      "org/gnome/desktop/input-sources" = {
        sources = [ ["xkb" "us"] ["xkb" "ru"] ];
        xkb-options = ["grp:alt_shift_toggle"];
        show-all-sources = true;
      };
      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
        show-input-method-menu = true;
      };
       # Настройки Dash to Dock в стиле Ubuntu
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "LEFT";
        dash-max-icon-size = 48;
        icon-size-fixed = true;
        apply-custom-theme = false;
        custom-background-color = true;
        background-color = "rgb(0,0,0)";
        background-opacity = 1.0;
        transparency-mode = "FIXED";
        autohide = false;
      };
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
        a = "add .";
        s = "status";
        m = "merge --no-ff";
        unfuck = "!git add . && git commit --amend && git push --force";
        l = "log";
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
