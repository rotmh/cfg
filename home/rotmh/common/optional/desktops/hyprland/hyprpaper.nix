{
  lib,
  config,
  ...
}: let
  cfg = config.hyprland;
in {
  options.hyprland = {
    wallpaper = lib.mkOption {
      type = lib.types.str;
      description = "The path of the wallpaper file to use";
    };
  };

  config = {
    services.hyprpaper = {
      settings = {
        preload = [
          cfg.wallpaper
        ];
        wallpaper = [
          ", ${cfg.wallpaper}"
        ];
      };
    };
  };
}
