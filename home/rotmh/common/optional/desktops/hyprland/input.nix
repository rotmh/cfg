{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,il";
      kb_options = [
        "grp:alt_shift_toggle"

        "caps:swapescape"
      ];

      repeat_rate = 60; # per second
      repeat_delay = 300; # in milliseconds

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
