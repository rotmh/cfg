{
  inputs,
  config,
  lib,
  hostSpec,
  ...
}: {
  # NOTE: this module is only meant for use inside home-manager.

  imports = [
    ./host-spec.nix
  ];

  config = {
    lib.meta = {
      mkMutableSymlink = path:
        config.lib.file.mkOutOfStoreSymlink
        (hostSpec.flake
          + lib.strings.removePrefix (toString inputs.self) (toString path));
    };
  };
}
