{pkgs, ...}: {
  # languages tooling
  home.packages = with pkgs; [
    yaml-language-server
    marksman # markdown
    markdown-oxide
    nixd
    nixfmt-rfc-style
    alejandra # nix formatter
    vscode-langservers-extracted
    taplo # toml
    python3
    python3Packages.python-lsp-server
  ];
}
