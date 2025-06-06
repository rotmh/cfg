{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    go
    delve
    gopls
    golangci-lint
    golangci-lint-langserver
  ];
}
