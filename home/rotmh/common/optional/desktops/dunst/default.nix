{
  config,
  lib,
  pkgs,
  ...
}: {
  # services.dunst = {
  #   enable = true;
  # };

  home.packages = with pkgs; [
    dunst
  ];

  # xdg.configFile = lib.mkIf true (removeAttrs config.xdg.configFile ["dunst/dunstrc"]);

  # xdg.configFile."dunst/dunstrc" = lib.mkOverride 1 (lib.mkIf false {text = null;});

  xdg.configFile."dunst" = {
    source = config.lib.meta.mkMutableSymlink ./dunst;
    recursive = true;
  };

  # services.dunst = {
  #   enable = true;

  #   settings = {
  #     global = {
  #       width = "400";
  #       offset = "10x10";

  #       progress_bar_min_width = 380;
  #       progress_bar_max_width = 380;
  #       progress_bar_corner_radius = 2;

  #       padding = 10;
  #       horizontal_padding = 10;
  #       frame_width = 1;
  #       gap_size = 3;
  #       font = "JetBrainsMono Nerd Font 12";

  #       icon_theme = "rose-pine-icons";
  #       enable_recursive_icon_lookup = true;
  #       corner_radius = 2;

  #       background = "#000000b0";
  #       foreground = "#e0def4";

  #       origin = "bottom-right";
  #       # timeout = 5;
  #     };

  #     urgency_low = {
  #       background = "#000000b0";
  #       highlight = "#3e8fb0";
  #       frame_color = "#3e8fb0";
  #       default_icon = "dialog-information";
  #       format = "<b><span foreground='#3e8fb0'>%s</span></b>\n%b";
  #     };
  #     urgency_normal = {
  #       background = "#000000b0";
  #       highlight = "#f6c177";
  #       frame_color = "#f6c177";
  #       default_icon = "dialog-warning";
  #       format = "<b><span foreground='#f6c177'>%s</span></b>\n%b";
  #     };
  #     urgency_critical = {
  #       background = "#000000b0";
  #       highlight = "#eb6f92";
  #       frame_color = "#eb6f92";
  #       default_icon = "dialog-error";
  #       format = "<b><span foreground='#eb6f92'>%s</span></b>\n%b";
  #     };
  #   };
  # };
}
