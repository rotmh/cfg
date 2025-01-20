{
  imports = [
    ./settings.nix
    ./languages.nix
    ./themes.nix

    ./support
  ];

  programs.helix = {
    enable = true;

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
