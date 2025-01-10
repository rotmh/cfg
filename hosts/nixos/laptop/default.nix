{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    (map lib.custom.relativeToRoot [
      "hosts/common/core"

      "hosts/common/optional/audio.nix" # pipewire and cli controls
      "hosts/common/optional/hyprland.nix" # window manager
      "hosts/common/optional/vlc.nix" # media player
    ])
  ];

  hostSpec = {
    hostName = "laptop";
  };

  networking = {
    networkmanager.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
