{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = ["Atkinson Hyperlegible"];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    atkinson-hyperlegible
  ];
}
