# home level sops. see hosts/common/optional/sops.nix for hosts level
{
  inputs,
  config,
  lib,
  hostSpec,
  ...
}: let
  secretsDirectory = builtins.toString inputs.nix-secrets;
  secretsFilePath = "${secretsDirectory}/secrets.yaml";
  homeDirectory = config.home.homeDirectory;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the location of the host specific age-key for ta and will to have been extracted to this location via hosts/common/core/sops.nix on the host
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";

    defaultSopsFile = "${secretsFilePath}";
    validateSopsFiles = false;

    secrets = {
      "users/${hostSpec.username}/gpg/public-key" = {};
    };
  };
}
