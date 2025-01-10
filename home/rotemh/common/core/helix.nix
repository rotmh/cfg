{pkgs, ...}: {
  programs.helix = {
    enable = true;

    defaultEditor = true;

    ignores = [
      "target/"
      "Cargo.lock"

      "go.sum"

      "node_modules/"
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
        rulers = [
          80
        ];
        bufferline = "multiple";

        end-of-line-diagnostics = "hint";

        inline-diagnostics = {
          cursor-line = "error";
        };
      };
    };
  };
}
