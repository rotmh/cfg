{pkgs, ...}: {
  imports = [
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

    themes = {
      my_theme = {
        inherits = "kanagawa";
        "ui.linenr" = {
          fg = "sumiInk6";
          bg = "sumiInk1";
        };
        "ui.gutter" = {
          fg = "sumiInk6";
          bg = "sumiInk1";
        };
      };
    };

    languages = {
      language-server = {
        rust-analyzer.config.check.command = "clippy";
        # crates-lsp.command = "crates-lsp";
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
          # TODO: configurate to support external flakes
        };
        iwe = {
          command = "iwes";
        };
      };

      language = [
        {
          name = "nix";
          language-servers = [
            "nixd"
          ];
          formatter = {
            command = "alejandra";
          };
          auto-format = true;
        }
        # {
        #   name = "crates";
        #   scope = "source.toml";
        #   injection-regex = "toml";
        #   file-types = [{glob = "Cargo.toml";}];
        #   comment-token = "#";
        #   language-servers = ["crates-lsp"];
        #   grammar = "toml";
        #   indent = {
        #     tab-width = 2;
        #     unit = "  ";
        #   };
        #   diagnostic-severity = "info";
        # }
        {
          name = "markdown";
          language-servers = [
            "marksman"
            "markdown-oxide"
            "iwe"
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

    settings = {
      theme = "my_theme";
      editor = {
        line-number = "relative";
        mouse = false;
        rulers = [80];
        bufferline = "multiple";

        end-of-line-diagnostics = "hint";

        inline-diagnostics = {
          cursor-line = "warning";
        };
      };

      keys = {
        insert = {
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          pageup = "no_op";
          pagedown = "no_op";
          home = "no_op";
          end = "no_op";
        };
        normal = {
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          pageup = "no_op";
          pagedown = "no_op";
          home = "no_op";
          end = "no_op";
        };
      };
    };
  };
}
