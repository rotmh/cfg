{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    themeFile = "kanagawabones";

    settings = {
      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;

      mode = "no-rc no-cursor";
    };

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Regular";
      size = 12;
    };
  };
}
