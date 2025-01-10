# User config applicable to both nixos and darwin
{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./nixos.nix
  ];

  users.users.${config.hostSpec.username} = {
    name = config.hostSpec.username;
    shell = pkgs.bash; # default shell
  };

  programs.bash.enable = true;
  environment.systemPackages = with pkgs; [
    just
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit pkgs inputs;
    };
    users.${config.hostSpec.username}.imports = lib.flatten [
      (
        {config, ...}:
          import (lib.custom.relativeToRoot "home/${config.hostSpec.username}/${config.hostSpec.hostName}.nix") {
            inherit pkgs inputs config lib;
          }
      )
    ];
  };
}
