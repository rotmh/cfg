{
  hostSpec,
  pkgs,
  inputs,
  ...
}: let
  gwfox = pkgs.stdenv.mkDerivation {
    pname = "gwfox-patched";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "akkva";
      repo = "gwfox";
      rev = "2ea734ce0ee65b31bcc57a58a8956c0db9a15f2c"; # "2.7.19";
      sha256 = "sha256-p8eNbGNy/sxMBJ0GEJ3sFMCCehqMwrzs9rhFb6Vg6pY=";
    };

    patches = [
      ./gwfox.patch
    ];

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
in {
  programs.firefox = {
    enable = true;

    languagePacks = ["en-US"];

    policies = {
      BlockAboutConfig = true;
    };

    profiles.${hostSpec.username} = {
      settings = {
        # Settings for gwfox
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "widget.windows.mica" = true;
        "widget.windows.mica.toplevel-backdrop" = 2;
        "sidebar.animation.enabled" = false;
        "gwfox.plus" = true;
        "gwfox.atbc" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "GitHub";
            tags = ["git" "scm"];
            keyword = "gh";
            url = "https://github.com";
          }
        ];
      };

      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          sponsorblock
          youtube-shorts-block
          # darkreader
          vimium
          refined-github
          simple-translate
        ];

        settings = {
        };
      };
    };
  };

  home.file.".mozilla/firefox/${hostSpec.username}/chrome".source = "${gwfox}/chrome";
}
