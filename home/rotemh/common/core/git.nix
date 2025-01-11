{
  pkgs,
  config,
  hostSpec,
  ...
}: let
  handle = hostSpec.handle;
  publicGitEmail = hostSpec.email;
  fingerprintPath = config.sops.secrets."users/${hostSpec.username}/gpg/fingerprint".path;
in {
  programs.git = {
    enable = true;

    userName = handle;
    userEmail = publicGitEmail;

    signing = {
      signByDefault = true;

      # FIXME: it only address `rotemh`
      #
      # key = builtins.readFile fingerprintPath;
      key = "B756 0EA3 E713 71C6 3E65  9224 FA54 92BE 76A4 974A";
    };

    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
        "ssh://git@gitlab.com" = {
          insteadOf = "https://gitlab.com";
        };
      };
    };
  };
}
