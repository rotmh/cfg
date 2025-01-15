{
  pkgs,
  lib,
  ...
}: let
  prettier = parser: {
    command = lib.getExe pkgs.nodePackages.prettier;
    args = lib.flatten [
      ["--parser" parser]
    ];
  };

  languages = [
    "css"
    "graphql"
    "html"
    "javascript"
    "json"
    "jsx"
    "markdown"
    "tsx"
    "typescript"
    "yaml"
  ];

  format = lang: {
    name = lang;
    formatter =
      if lib.elem lang ["jsx" "tsx" "javascript"]
      then prettier "typescript"
      else prettier lang;
  };
in {
  programs.helix.languages.language = map format languages;
}
