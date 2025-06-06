{pkgs, ...}: {
  home.packages = with pkgs; [
    python3

    python3Packages.python-lsp-server
  ];
}
