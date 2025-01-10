{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar.nix
    ./rofi.nix
  ];

  hyprland = {
    wallpaper = "${config.home.homeDirectory}/Images/Wallpapers/catching-the-desert.jpeg";
    hcursor = "bibata-modern-classic-hyprcursor";
    xcursor = "bibata-modern-classic-xcursor";
  };

  home.package = with pkgs; [
    wl-clipboard
    clipse
  ];
}
