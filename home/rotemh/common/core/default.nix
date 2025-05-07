{
  config,
  lib,
  pkgs,
  hostSpec,
  ...
}: {
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "modules/common/host-spec.nix"
    ])

    ./fish.nix
    ./bash.nix
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./zoxide.nix
    ./starship.nix
    ./helix
    ./wezterm
    ./tmux.nix
  ];

  services.ssh-agent.enable = true;

  home = {
    username = lib.mkDefault hostSpec.username;
    homeDirectory = lib.mkDefault hostSpec.home;
    stateVersion = lib.mkDefault "24.11";
    sessionPath = [
      "$HOME/bin"
    ];
    sessionVariables = {
      SHELL = "fish";
      TERM = "kitty";
      TERMINAL = "kitty";
      VISUAL = "hx";
      EDITOR = "hx";
      MANPAGER = "batman"; # see ./cli/bat.nix
    };
    preferXdgDirectories = true; # whether to make programs use XDG directories whenever supported
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/media/audio";
      pictures = "${config.home.homeDirectory}/media/images";
      videos = "${config.home.homeDirectory}/media/video";

      extraConfig = {
        XDG_PUBLICSHARE_DIR = "/var/empty";
        XDG_TEMPLATES_DIR = "/var/empty";
      };
    };
  };

  home.packages = with pkgs; [
    grex # create regexps to match test cases
    unrar
    sqlite
    mdbook
    cowsay
    ffmpeg
    wlogout
    zlib
    qpdf

    cachix

    pulseaudio

    gcc
    lldb

    sqlx-cli

    # TODO: delete me
    librsvg
    xorg.xcursorgen

    brightnessctl
    pamixer

    nwg-look

    gparted

    gnupg
    pinentry-curses
  ];

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
