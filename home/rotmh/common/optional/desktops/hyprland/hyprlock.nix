{config, ...}: let
  cfg = config.hyprland;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

      background = {
        path = cfg.wallpaper;

        blur_size = 6;
        blur_passes = 3;
        noise = 0.015;
        contrast = 1;
        brightness = 1;
      };

      input-field = {
        monitor = "";
        fade_on_empty = true;

        inner_color = "rgba(0, 0, 0, 0)"; # transparent
        outer_color = "rgba(0, 0, 0, 0.5)";
        outline_thickness = 2;
        size = "400, 50";

        placeholder_text = "";
        font_color = "rgba(0, 0, 0, 0.95)";
        dots_text_format = "*";
        font_family = "JetBrainsMono Nerd Font";
      };
    };
  };
}
