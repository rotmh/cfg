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
    # ./monitors.nix

    ./pyprland.nix
    ./hyprpaper.nix
    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprsunset.nix

    ./kanagawa.nix # theme
  ];

  home.file.".config/hypr/scripts/battery_notify.fish" = {
    source = ./scripts/battery_notify.fish;
    recursive = true;
    executable = true;
  };

  wayland.windowManager.hyprland.enable = true;
  services.hyprpaper.enable = true;

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
  ];
}
