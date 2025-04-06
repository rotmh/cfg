{pkgs, ...}: {
  home.packages = with pkgs; [
    stremio
    spotify
    discord
    element-desktop
    gimp
  ];
}
