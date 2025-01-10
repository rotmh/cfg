{pkgs, ...}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./env.nix
    ./input.nix
    ./look.nix
    ./vars.nix
    ./autostart.nix
    ./submap.nix

    # ./pyprland.nix
    ./hyprpaper.nix
    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprlock.nix

    ./rose-pine-moon.nix
  ];

  home.packages = with pkgs; [
    hyprsunset # blue light filter
  ];

  # Enable all the stuff configured in the imports,
  # thus making them disabled if the this module is disabled.
  wayland.windowManager.hyprland.enable = true;
  services.hyprpaper.enable = true;
}
