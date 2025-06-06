{
  inputs,
  lib,
  ...
}: {
  imports = lib.flatten [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p1

    ./hardware-configuration.nix

    (map lib.custom.relativeToRoot [
      "hosts/common/core"

      "hosts/common/optional/audio.nix" # pipewire and cli controls
      "hosts/common/optional/hyprland.nix" # window manager
      "hosts/common/optional/vlc.nix" # media player
      # "hosts/common/optional/ollama.nix" # locally run LLMs

      "hosts/common/optional/docker.nix"
      "hosts/common/optional/auto-switch.nix" # rebuild the system every night

      "hosts/common/optional/nvidia.nix"

      "hosts/common/optional/vpn-setup.nix"
    ])
  ];

  services.fprintd.enable = true;
  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
  };

  hostSpec = {
    hostName = "laptop";
  };

  networking = {
    networkmanager.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
