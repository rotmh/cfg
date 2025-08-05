{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "nixos-hardware";
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

    helix-git = {
      url = "github:helix-editor/helix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-git.url = "github:sxyazi/yazi";

    sherlock-git.url = "github:Skxxtz/sherlock";

    hyprland-git = {
      url = "github:hyprwm/Hyprland";

      #   Do not override Hyprland’s nixpkgs input unless
      #   you know what you are doing.
      #   Doing so will make the cache useless, since you're
      #   building from a different Nixpkgs commit.
      #
      # ref: https://wiki.hyprland.org/Nix/Cachix

      # inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock-git = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell-git = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
