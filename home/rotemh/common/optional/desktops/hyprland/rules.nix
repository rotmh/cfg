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
  };
}
