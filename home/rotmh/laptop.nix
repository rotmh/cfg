# WARNING: this must be a function; i.e., don't remove the empty braces (`{...}`).
#
# UPDATE: currently the braces are not empty, thus making it less likely for me
# to remove them, but I will keep the warning just in case.
{lib, ...}: {
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "modules/common/helpers.nix"
    ])

    ./common/core

    ./common/optional/sops.nix

    ./common/optional/browsers/firefox.nix
    ./common/optional/browsers/tor.nix

    ./common/optional/desktops
    ./common/optional/apps
    ./common/optional/dev
    ./common/optional/terminal

    ./common/optional/yazi.nix
  ];
}
