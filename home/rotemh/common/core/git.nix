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
      key = "FA5492BE76A4974A";
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
