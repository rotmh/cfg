{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;

      "col.active_border" = "$waveAqua1";
      "col.inactive_border" = "$winterBlue";

      layout = "dwindle";

      resize_on_border = true;
    };

    decoration = {
      rounding = 10;

      active_opacity = 0.85;
      inactive_opacity = 0.85;

      # shadow = {
      #   enabled = true;
      #   range = 10;
      #   render_power = 3;
      #   offset = "0, 0";
      #   color = "$pine";
      #   color_inactive = "0xff$baseAlpha";
      # };

      blur = {
        enabled = true;
        size = 6;
        passes = 3;
      };
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };
  };
}
