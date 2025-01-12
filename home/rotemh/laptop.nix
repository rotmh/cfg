{...}: {
  imports = [
    ./common/core

    ./common/optional/sops.nix

    ./common/optional/browsers
    ./common/optional/desktops
    ./common/optional/apps
    ./common/optional/dev
    ./common/optional/terminal
  ];
}
