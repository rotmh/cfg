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
      url = "git+ssh://git@github.com/rotmh/secrets.git?ref=main";
      inputs = {};
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (nixpkgs) lib;

    system = "x86_64-linux";

    mkHost = host: {
      ${host} = lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs outputs;

          lib = nixpkgs.lib.extend (self: super: {custom = import ./lib {inherit (nixpkgs) lib;};});
        };
        modules = [
          ./hosts/nixos/${host}
        ];
      };
    };

    mkHostConfigs = hosts: lib.foldl (acc: set: acc // set) {} (lib.map (host: mkHost host) hosts);

    readHosts = folder: lib.attrNames (builtins.readDir ./hosts/${folder});
  in {
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = mkHostConfigs (readHosts "nixos");
  };
}
