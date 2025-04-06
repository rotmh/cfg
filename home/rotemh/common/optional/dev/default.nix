{pkgs, ...}: {
  imports = [
    ./lang

    ./docker.nix
    ./cli.nix
  ];

  home.packages = with pkgs; [
    harper
  ];
}
