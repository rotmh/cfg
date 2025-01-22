{
  systemd.user = {
    services.clean-helix-log = {
      Unit = {
        Description = "Clean Helix's log file";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "rm ~/.cache/helix/helix.log";
      };
    };
    timers.clean-helix-log = {
      Unit = {
        Description = "Clean Helix's log file on schedule";
      };
      Timer = {
        OnCalendar = "weekly";
        Persistent = true;
      };
      Install = {
        WantedBy = ["timers.target"];
      };
    };
  };
}
