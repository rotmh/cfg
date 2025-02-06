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

    cargo-expand
    cargo-watch
  ];

  home.file.".config/rustfmt/rustfmt.toml".text = ''
    format_code_in_doc_comments = true
    format_strings = true
  '';
}
