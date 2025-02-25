{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    hypridle
    hyprcursor
    hyprpaper
    hyprsunset
    hyprlock

    xdg-desktop-portal-hyprland
  ];

  xdg.configFile."hypr" = {
    source = config.lib.meta.mkMutableSymlink ./hypr;
    recursive = true;
  };
}
