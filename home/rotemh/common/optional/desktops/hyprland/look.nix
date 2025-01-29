{
  wayland.windowManager.hyprland.settings = {
    #---------------------------------------------------------
    #                         General
    #---------------------------------------------------------

    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;

      "col.active_border" = "$waveAqua1";
      "col.inactive_border" = "$winterBlue";

      layout = "dwindle";

      resize_on_border = true;
    };

    #---------------------------------------------------------
    #                         Decoration
    #---------------------------------------------------------

    decoration = {
      rounding = 10;

      active_opacity = 0.85;
      inactive_opacity = 0.85;

      #---------------------------------------------------------
      #                         Shadows
      #---------------------------------------------------------

      # shadow = {
      #   enabled = true;
      #   range = 30;
      #   color = 0 x70000000;
      # };

      #---------------------------------------------------------
      #                         Opacity
      #---------------------------------------------------------

      #---------------------------------------------------------
      #                         Blur
      #---------------------------------------------------------

      blur = {
        enabled = true;
        size = 6;
        passes = 3;

        ignore_opacity = 1;
        new_optimizations = true;
        noise = 0.015;
        contrast = 1;
        brightness = 1;
        popups = true;
        popups_ignorealpha = 0.8;
        special = false;
      };
    };

    #---------------------------------------------------------
    #                         Animations
    #---------------------------------------------------------

    animations = {
      enabled = true;

      # bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      bezier = [
        "wind, 0, 1.2, 0, 1"
        "smoothIn, 0.25, 1, 0.5, 1"
        "winIn, 0.1, 1.1, 0.1, 1.05"
        "linear, 1, 1, 1, 1"
      ];

      animation = [
        # buttery_smoooooooth... (slide)
        # "windows, 1, 5, wind, slide"
        # "windowsIn, 1, 4, winIn, slide"
        # "windowsOut, 1 , 7, smoothIn, slide"
        # "windowsMove, 1, 6, default"
        # "fade, 1, 5, smoothIn"
        # "fadeOut, 1, 3, smoothIn"
        # "fadeDim, 1, 3, smoothIn"
        # "workspaces, 1, 4, wind, slidefadevert 15%"
        # "specialWorkspace, 1, 3, default, slidefadevert 15%"

        # buttery_smoooooooth...  (Popin...)
        # "windows, 1, 3, default, popin 70%"
        # "windowsOut, 1, 20, default, popin 85%"
        # "windowsMove, 1, 7, default"
        # "fade, 1, 6, smoothIn"
        # "fadeOut, 1, 3, smoothIn"
        # "fadeDim, 1, 3, smoothIn"
        # "workspaces, 1, 5, wind, slidefadevert 40%"

        # fasssstt popin
        "windows, 1, 4, wind, slide"
        "windowsOut, 1, 5, default, popin 90%"
        "windowsMove, 1, 5, default"
        "layers, 1, 5, default, slide"
        "fade, 1, 5, smoothIn"
        "fadeOut, 1, 2, smoothIn"
        "fadeDim, 1, 3, smoothIn"
        "workspaces, 1, 3, default, slidefadevert 15%"
        "specialWorkspace, 1, 3, default, slidefadevert 15%"

        # "windows, 1, 7, myBezier"
        # "windowsOut, 1, 7, default, popin 80%"
        # "border, 1, 10, default"
        # "borderangle, 1, 8, default"
        # "fade, 1, 7, default"
        # "workspaces, 1, 6, default"
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
