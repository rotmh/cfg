{pkgs, ...}: {
  home.packages = with pkgs; [
    live-server
    smartcat
    openvpn
    gnumake

    tree-sitter

    gdb

    cmake
  ];
}
