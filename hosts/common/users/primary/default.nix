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
    shell = pkgs.fish; # default shell; WARNING: this might break shit
  };

  # Stuff we want no matter what
  programs.fish.enable = true;
  programs.git.enable = true;
  programs.direnv.enable = true;
  environment.systemPackages = with pkgs; [
    just
    sops
    tree
    coreutils
    which
    fzf
    jq
    htop
    ripgrep
    curl
    neofetch
    libnotify
    openssl
    openssl.dev
    openssl
    pkg-config
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
