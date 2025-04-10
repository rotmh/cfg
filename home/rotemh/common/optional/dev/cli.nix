{pkgs, ...}: {
  home.packages = with pkgs; [
    live-server
    smartcat
    openvpn
  ];
}
