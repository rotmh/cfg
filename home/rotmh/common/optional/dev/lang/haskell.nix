{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghc

    cabal-install
    stack

    haskell-language-server

    stylish-haskell
    ormolu
  ];
}
