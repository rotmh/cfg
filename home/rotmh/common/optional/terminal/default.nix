{pkgs, ...}: {
  home.packages = with pkgs; [
    ttyper
  ];
}
