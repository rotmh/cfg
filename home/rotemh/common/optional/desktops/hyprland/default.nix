{
  imports = [
    ./binds.nix
    ./rules.nix
    ./env.nix
    ./input.nix
    ./look.nix
    ./vars.nix
    ./autostart.nix
    ./submap.nix
    # ./monitors.nix

    ./pyprland.nix
    ./hyprpaper.nix
    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprsunset.nix

    ./kanagawa.nix # theme
  ];

  wayland.windowManager.hyprland.enable = true;
  services.hyprpaper.enable = true;
}
