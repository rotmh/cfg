{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    material-symbols
    cava

    qt6Packages.qt5compat
    qt6Packages.qtbase
    qt6Packages.qtpositioning
    qt6Packages.qtwayland
    qt6Packages.qttools
    qt6Packages.qtdeclarative

    qt6Packages.qtlanguageserver

    libsForQt5.qtgraphicaleffects

    kdePackages.qt5compat
    kdePackages.qtpositioning

    hyprland-qt-support
    hyprland-qtutils
  ];

  programs.quickshell = {
    enable = true;
    package = inputs.quickshell-git.packages.${pkgs.system}.default;
  };

  xdg.configFile."quickshell" = {
    source = config.lib.meta.mkMutableSymlink ./quickshell;
    recursive = true;
  };
}
