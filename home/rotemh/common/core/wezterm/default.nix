{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm" = {
    source = config.lib.meta.mkMutableSymlink ./wezterm;
    recursive = true;
  };
}
