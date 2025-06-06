{inputs, ...}: {
  imports = [
    inputs.sherlock-git.homeManagerModules.default
  ];

  programs.sherlock = {
    enable = true;
    settings = {
      aliases = {};
      config = {
        binds = {
          prev = "C-p";
          next = "C-n";
        };
      };
      ignore = ''
        Helix
        Yazi
        Rofi*
        Htop
      '';
      launchers = [
        {
          name = "App Launcher";
          type = "app_launcher";
          args = {};
          priority = 1;
          home = true;
        }
      ];
    };
  };
}
