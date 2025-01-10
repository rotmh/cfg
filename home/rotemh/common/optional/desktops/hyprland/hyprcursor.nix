{
  lib,
  config,
  ...
}: let
  cfg = config.hyprland;
in {
  options.hyprland = {
    hcursor = lib.mkOption {
      type = lib.types.str;
      description = "The name of the directory in ~/local/share/icons that contains the hyprcursor";
    };
    xcursor = lib.mkOption {
      type = lib.types.str;
      description = "The name of the directory in ~/local/share/icons that contains the xcursor";
    };
  };

  config = {
    wayland.windowManager.hyprland.settings = {
      env = [
        "HYPRCURSOR_THEME, ${cfg.hcursor}"
        "XCURSOR_THEME, ${cfg.xcursor}"

        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
      ];
      exec-once = [
        "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic"
        "gsettings set org.gnome.desktop.interface cursor-size 24"
      ];
    };
  };
}
