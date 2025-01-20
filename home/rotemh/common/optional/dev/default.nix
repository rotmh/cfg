{pkgs, ...}: {
  imports = [
    ./lang

    ./cli.nix
  ];

  home.packages = with pkgs; [
    harper
  ];
}
