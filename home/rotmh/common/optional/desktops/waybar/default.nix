{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar" = {
    source = config.lib.meta.mkMutableSymlink ./waybar;
    recursive = true;
  };
}
