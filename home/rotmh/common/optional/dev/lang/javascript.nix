{pkgs, ...}: {
  home.packages = with pkgs; [
    typescript-language-server

    nodejs
  ];
}
