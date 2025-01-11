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

    ./bash.nix
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./zoxide.nix
    ./helix.nix
    ./starship.nix
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
      SHELL = "bash";
      TERM = "kitty";
      TERMINAL = "kitty";
      VISUAL = "hx";
      EDITOR = "hx";
      # MANPAGER = "batman"; # see ./cli/bat.nix
    };
    preferXdgDirectories = true; # whether to make programs use XDG directories whenever supported
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/.desktop";
      documents = "${config.home.homeDirectory}/doc";
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
    ripgrep # recursive regex greping
    grex # create regexps to match test cases
    fzf # fuzzy finder
    jq # CLI to do json stuff
    unrar
    sqlite
    mdbook
    tree # view dir structure
    bat # print file content (like `cat`)
    neofetch
    which
    cowsay
    curl
    ffmpeg
    openssl
    wlogout
    zlib
    qpdf

    yazi
    ttyper

    # screenshots
    grim
    slurp
    hyprpicker
    hyprshot

    rofi-wayland

    libnotify

    gcc
    lldb

    sqlx-cli

    # TODO: delete me
    librsvg
    xorg.xcursorgen

    brightnessctl
    pamixer

    nwg-look

    stremio
    spotify
    discord
    element-desktop

    gparted

    gnupg
    pinentry-curses

    yaml-language-server
    marksman # markdown
    markdown-oxide
    nixd
    nixfmt-rfc-style
    alejandra # nix formatter
    vscode-langservers-extracted
    taplo # toml
    python3
    python3Packages.python-lsp-server
  ];

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
