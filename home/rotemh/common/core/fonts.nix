{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Atkinson Hyperlegible Next"];
      monospace = ["Atkinson Hyperlegible Mono"];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto

    atkinson-hyperlegible-next
    atkinson-hyperlegible-mono
  ];
}
