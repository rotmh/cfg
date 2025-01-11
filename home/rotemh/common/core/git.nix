{
  pkgs,
  config,
  hostSpec,
  ...
}: let
  handle = hostSpec.handle;
  publicGitEmail = hostSpec.email;
  publicKey = config.sops.secrets."users/${hostSpec.username}/gpg/public-key";
in {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = handle;
    userEmail = publicGitEmail;
    aliases = {};
    extraConfig = {
      init.defaultBranch = "main";
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
        "ssh://git@gitlab.com" = {
          insteadOf = "https://gitlab.com";
        };
      };

      commit.gpgsign = true;
      user.signing.key = "${publicKey}";
    };
    signing = {
      signByDefault = true;
      key = publicKey;
    };
  };
}
