{
  config,
  lib,
  pkgs,
  ...
}: let
  sopsHashedPasswordFile = config.sops.secrets."users/${config.hostSpec.username}/passwordHash".path;
in {
  users.mutableUsers = false; # Only allow declarative credentials; Required for password to be set via sops during system activation!
  users.users.${config.hostSpec.username} = {
    home = "/home/${config.hostSpec.username}";
    isNormalUser = true;
    hashedPasswordFile = sopsHashedPasswordFile; # Blank if sops is not working.
    password = lib.mkForce "nixos"; # This gets overridden if sops is working; it is only used with nixos-installer

    extraGroups = lib.flatten [
      "wheel"
      "audio"
      "video"
      "docker"
      "git"
      "networkmanager"
    ];
  };

  # root's ssh key are mainly used for remote deployment, borg, and some other specific ops
  users.users.root = {
    shell = pkgs.bash;
    hashedPasswordFile = config.users.users.${config.hostSpec.username}.hashedPasswordFile;
    password = lib.mkForce config.users.users.${config.hostSpec.username}.password; # This gets overridden if sops is working; it is only used if the config.hostSpec.hostName == "iso"
    # root's ssh keys are mainly used for remote deployment.
    openssh.authorizedKeys.keys = config.users.users.${config.hostSpec.username}.openssh.authorizedKeys.keys;
  };

  home-manager.users.root = {
    home.stateVersion = "24.11";
    programs.bash = {
      enable = true;
    };
  };
}
