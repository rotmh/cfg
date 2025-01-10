{
  pkgs,
  config,
  ...
}: let
  handle = config.hostSpec.handle;
  publicGitEmail = config.hostSpec.email.gitHub;
  publicKey = "${config.home.homeDirectory}/.ssh/id_yubikey.pub";
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
