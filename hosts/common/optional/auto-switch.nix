{inputs, ...}: {
  systemd.user.timers.update-flake-inputs = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "4:20";
      Persistent = true;
    };
  };

  systemd.user.services.update-flake-inputs = {
    script = ''
      nix flake update --flake ${inputs.self.outPath}
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    allowReboot = true;
    dates = "4:40";
    flags = ["--upgrade-all" "-L"];
  };
}
