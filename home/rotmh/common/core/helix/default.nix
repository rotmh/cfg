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

  nix.settings = {
    extra-substituters = ["https://helix.cachix.org"];
    extra-trusted-public-keys = ["helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="];
  };

  programs.helix = {
    enable = true;

    package = inputs.helix-git.packages.${pkgs.system}.default;

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
