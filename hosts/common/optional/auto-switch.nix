{config, ...}: {
  systemd.services."flake-update" = {
    script = ''
      nix flake update --flake ${config.hostSpec.flake}
      nixos-rebuild switch --flake ${config.hostSpec.flake}${"#"}${config.hostSpec.hostName} --upgrade-all
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };

  systemd.timers."flake-update" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "04:00";
      Persistent = true;
    };
  };
}
