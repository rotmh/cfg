{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./languages.nix
    ./themes.nix
    ./timers.nix

    ./support
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

    defaultEditor = true;

    ignores = [
      "target/"
      "Cargo.lock"

      "go.sum"

      "node_modules/"

      "flake.lock"
    ];
  };
}
