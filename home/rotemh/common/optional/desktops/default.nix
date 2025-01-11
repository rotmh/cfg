{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar.nix
    ./rofi.nix
    ./dunst.nix
  ];

  hyprland = {
    wallpaper = "${config.home.homeDirectory}/Images/Wallpapers/catching-the-desert.jpeg";
    hcursor = "bibata-modern-classic-hyprcursor";
    xcursor = "bibata-modern-classic-xcursor";
  };

  services.avizo.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    clipse
  ];
}
