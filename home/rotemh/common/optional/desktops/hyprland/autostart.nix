{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "pypr"
      "clipse -listen" # clipboard

      "${config.home.homeDirectory}/.config/hypr/scripts/battery_notify.fish"
    ];
  };
}
