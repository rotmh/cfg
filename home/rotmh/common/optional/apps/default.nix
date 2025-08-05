{pkgs, ...}: {
  home.packages = with pkgs; [
    stremio
    spotify
    discord
    element-desktop
    # gimp
    davinci-resolve

    github-cli

    zellij

    wiki-tui

    kakoune

    tofi
  ];

  programs.nh.enable = true;

  programs.ncspot = {
    enable = true;
  };

  programs.eww = {
    enable = true;
  };
}
