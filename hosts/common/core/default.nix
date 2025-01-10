{
  inputs,
  outputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    # inputs.sops-nix.nixosModules.sops

    (map lib.custom.relativeToRoot [
      "hosts/common/core/nixos.nix"
      # "hosts/common/core/sops.nix"
      "hosts/common/users/primary"
    ])
  ];

  hostSpec = {
    username = "rotemh";
    handle = "rotemhoresh";
    inherit (inputs.nix-secrets) domain email userFullName networking;
  };

  networking.hostName = config.hostSpec.hostName;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  # uncomment if you want home-manager to backup existing file it wants to
  # write, instead of just aborting when encountering them.
  #
  # home-manager.backupFileExtension = "home_manager_backup";

  nixpkgs = {
    overlays = [
      outputs.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # See https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB

      trusted-users = ["@wheel"];
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      warn-dirty = false;

      allow-import-from-derivation = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
