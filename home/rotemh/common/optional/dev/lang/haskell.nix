{pkgs, ...}: {
  home.packages = with pkgs; [
    ghc

    cabal-install

    haskell-language-server

    stylish-haskell
  ];
}
