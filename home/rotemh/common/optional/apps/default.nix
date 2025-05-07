{pkgs, ...}: {
  home.packages = with pkgs; [
    stremio
    spotify
    discord
    element-desktop
    # gimp
    # davinci-resolve

    github-cli
  ];
}
