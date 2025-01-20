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
      rust-analyzer.config.check.command = "clippy";
      nixd = {
        command = lib.getExe pkgs.nixd;
        # TODO: configurate to support external flakes
      };
    };

    language = [
      {
        name = "text";
        language-servers = [
          "harper-ls"
        ];
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
        formatter = {
          command = lib.getExe pkgs.alejandra;
        };
        auto-format = true;
      }
      {
        name = "markdown";
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
