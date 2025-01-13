{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  hostSpec = config.hostSpec;
in {
  imports = [
    ./nixos.nix
  ];

  users.users.${hostSpec.username} = {
    name = hostSpec.username;
    shell = pkgs.bash; # default shell
  };

  # Stuff we want no matter what
  programs.git.enable = true;
  programs.direnv.enable = true;
  environment.systemPackages = with pkgs; [
    just
    tree
    coreutils
    which
    bat
    fzf
    jq
    ripgrep
    curl
    neofetch
    libnotify
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit pkgs inputs;
      hostSpec = config.hostSpec;
    };
    users.${hostSpec.username}.imports = lib.flatten [
      (
        {config, ...}:
          import (
            lib.custom.relativeToRoot
            "home/${hostSpec.username}/${hostSpec.hostName}.nix"
          ) {
            inherit pkgs inputs config lib hostSpec;
          }
      )
    ];
  };
}
