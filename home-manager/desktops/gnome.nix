{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.compiz-windows-effect
  ];

  home.file.".background-image".source = /home/leonid/nixos-config/walpappers/nix-os-girl.png;

  dconf = {
    enable = true;
    settings = {
      # Обои
      "org/gnome/desktop/background" = {
        "picture-uri" = ".background-image";
        "picture-uri-dark" = ".background-image";
      };
      "org/gnome/desktop/screensaver" = {
        "picture-uri" = ".background-image";
        "picture-uri-dark" = ".background-image";
      };
      # https://discourse.nixos.org/t/enabling-gnome-extensions-with-home-manager/59701
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "dash-to-dock@charlesg99"
          "compiz-windows-effect@hermes83"
        ];
      };
      "org/gnome/desktop/input-sources" = {
        sources = [
          [
            "xkb"
            "us"
          ]
          [
            "xkb"
            "ru"
          ]
        ];
        xkb-options = [ "grp:alt_shift_toggle" ];
        show-all-sources = true;
      };
      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
        show-input-method-menu = true;
      };
      # Ночной режим
      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-temperature = 3700;
        night-light-schedule-automatic = false;
        night-light-schedule-from = 0.0;
        night-light-schedule-to = 0.0;
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
        show-trash = false;
      };
    };
  };
}
