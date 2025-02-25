{
  config,
  lib,
  ...
}: {
  options.hostSpec = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The username of the host";
    };
    hostName = lib.mkOption {
      type = lib.types.str;
      description = "The hostname of the host";
    };
    email = lib.mkOption {
      type = lib.types.str;
      description = "The email of the user";
    };
    network = lib.mkOption {
      default = {};
      type = lib.types.attrsOf lib.types.anything;
      description = "An attribute set of networking information";
    };
    userFullName = lib.mkOption {
      type = lib.types.str;
      description = "The full name of the user";
    };
    handle = lib.mkOption {
      type = lib.types.str;
      description = "The handle of the user (eg: github user)";
    };
    home = lib.mkOption {
      type = lib.types.str;
      description = "The home directory of the user";
      default = let user = config.hostSpec.username; in "/home/${user}";
    };
    flake = lib.mkOption {
      type = lib.types.str;
      description = "The directory of this flake in the file system (not in store)";
      default = let home = config.hostSpec.home; in "${home}/cfg";
    };
  };
}
