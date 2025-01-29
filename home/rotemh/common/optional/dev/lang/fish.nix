{pkgs, ...}: {
  home.packages = with pkgs; [
    fish-lsp
  ];
}
