{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hardware.url = "nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-secrets = {
      url = "git+ssh://git@github.com/rotemhoresh/nix-secrets.git?ref=main";
    };

    # pyprland.url = "github:hyprland-community/pyprland";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (nixpkgs) lib;

    system = "x86_64-linux";

    mkHost = host:
      lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./hosts/nixos/${host}
        ];
      };

    mkHostConfigs = hosts: lib.foldl (acc: set: acc // set) {} (lib.map (host: mkHost host) hosts);

    readHosts = folder: lib.attrNames (builtins.readDir ./hosts/${folder});
  in {
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = mkHostConfigs (readHosts "nixos");
  };
}
