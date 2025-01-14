{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"

      "float, class:(clipse)"
      "size 622 652, class:(clipse)"
    ];

    layerrule = [
      "blur, waybar"
      "blur, dunst"
    ];

    workspace = [
      "1, monitor:eDP-1"
      "2, monitor:eDP-1"
      "3, monitor:eDP-1"

      "4, monitor:HDMI-A-1"
      "5, monitor:HDMI-A-1"
      "6, monitor:HDMI-A-1"
      "7, monitor:HDMI-A-1"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"

      "10, monitor:eDP-1"
    ];
  };
}
