{
  pkgs,
  lib,
  ...
}: let
  kanagawa = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "dracula";
    version = "0.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "Nybkox";
      repo = "tmux-kanagawa";
      rev = "0d2db8d95e1b74643a06802043c7000a79ba0a0a";
      hash = "sha256-9S4HQHuECGLPLdPishmwEO0twdeQ6mZQfIMNFFDkgQ8=";
    };
  };
in {
  programs.tmux = {
    enable = true;

    clock24 = true;
    keyMode = "vi";
    shell = lib.getExe pkgs.fish;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank

      {
        plugin = kanagawa;
        extraConfig = ''
          set -g @kanagawa-show-battery false
          set -g @kanagawa-show-powerline true
          set -g @kanagawa-refresh-rate 10
          set -g @kanagawa-show-battery false
          set -g @kanagawa-show-powerline true
        '';
      }
    ];

    extraConfig = ''
      set -g default-terminal "tmux-256color"
    '';
  };
}
