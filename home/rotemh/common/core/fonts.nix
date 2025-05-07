{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Iosevka Regular"];
      monospace = ["JetBrainsMonoNL Nerd Font"];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto

    iosevka

    atkinson-hyperlegible-next
    atkinson-hyperlegible-mono
  ];
}
