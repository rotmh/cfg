{lib, ...}: {
  imports = lib.flatten [
    ./hardware-configuration.nix

    (map lib.custom.relativeToRoot [
      "hosts/common/core"

      "hosts/common/optional/audio.nix" # pipewire and cli controls
      "hosts/common/optional/hyprland.nix" # window manager
      "hosts/common/optional/vlc.nix" # media player
      "hosts/common/optional/ollama.nix" # locally run LLMs

      "hosts/common/optional/docker.nix"
      "hosts/common/optional/auto-switch.nix" # rebuild the system every night
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
