{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    (inputs.fenix.packages.${system}.latest.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rust-std"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly

    cargo-watch
  ];
}
