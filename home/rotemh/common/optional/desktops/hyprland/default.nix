{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    hypridle
    hyprcursor
    hyprpaper
    hyprsunset
    hyprpicker

    (inputs.hyprlock-git.packages.${pkgs.system}.default)

    xdg-desktop-portal-hyprland
  ];

  xdg.configFile."hypr" = {
    source = config.lib.meta.mkMutableSymlink ./hypr;
    recursive = true;
  };
}
