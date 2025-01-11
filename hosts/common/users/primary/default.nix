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

  # Is seems as though it is enabled by default, thus making this enablement imposible.
  #
  # programs.bash.enable = true;

  environment.systemPackages = with pkgs; [
    just
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
