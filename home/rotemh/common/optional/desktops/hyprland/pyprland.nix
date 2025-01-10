{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.pyprland.packages.${pkgs.stdenv.hostPlatform.system}.pyprland
  ];
}
