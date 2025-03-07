{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language-server = {
      harper-ls = {
        command = "harper-ls";
        args = ["--stdio"];
      };
      rust-analyzer.config = {
        check.command = "clippy";
        cargo = {
          # Make r-a use a different target directory, to prevent from locking
          # `Cargo.lock` at the expense of duplicating build artifacts.
          targetDir = true;
          features = "all";
        };
      };
      nixd = {
        command = lib.getExe pkgs.nixd;
        # TODO: configurate to support external flakes
      };
      crates-lsp.command = "/home/rotemh/projects/crates-language-server/target/debug/crates-language-server";
      tailwindcss-ls = {
        command = lib.getExe pkgs.tailwindcss-language-server;
        args = ["--stdio"];
        config = {
          tailwindCSS = {
            experimental = {
              classRegex = [
                " \\.\"([^\"]*)\""
              ];
            };
          };
          userLanguages = {
            rust = "html";
            "*.rs" = "html";
          };
        };
      };
    };

    language = [
      {
        name = "rust";
        language-servers = [
          "rust-analyzer"
          "tailwindcss-ls"
        ];
      }
      {
        name = "crates";
        scope = "source.toml";
        injection-regex = "toml";
        file-types = [
          {
            glob = "Cargo.toml";
          }
        ];
        comment-token = "#";
        language-servers = [
          "crates-lsp"
          "taplo"
        ];
        grammar = "toml";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "c";
        formatter.command = "${pkgs.clang-tools}/bin/clang-format";
      }
      {
        name = "haskell";
        formatter.command = lib.getExe pkgs.stylish-haskell;
      }
      {
        name = "nix";
        language-servers = [
          "nixd"
        ];
        formatter.command = lib.getExe pkgs.alejandra;
        auto-format = true;
      }
      {
        name = "markdown";
        language-servers = [
          "marksman"
          "markdown-oxide"
          "harper-ls"
        ];
        auto-format = true;
      }
      {
        name = "python";
        auto-format = true;
      }
      {
        name = "typescript";
        auto-format = true;
      }
      {
        name = "javascript";
        auto-format = true;
      }
    ];
  };
}
