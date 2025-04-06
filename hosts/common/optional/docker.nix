{config, ...}: {
  virtualisation.docker = {
    enable = true;
  };

  users.users.${config.hostSpec.username}.extraGroups = ["docker"];
}
