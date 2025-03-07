{pkgs, ...}: {
  imports = [
    ./hyprland
    ./waybar
    ./rofi.nix
    ./dunst.nix
  ];

  # hyprland = {
  #   wallpaper = "${config.xdg.userDirs.pictures}/wallpapers/city-rain.png";
  #   hcursor = "bibata-modern-classic-hyprcursor";
  #   xcursor = "bibata-modern-classic-xcursor";
  # };

  services.avizo.enable = true;

  home.packages = with pkgs; [
    # clipboard
    wl-clipboard
    clipse

    # screenshots
    grim
    slurp
    hyprpicker
    hyprshot
  ];
}
