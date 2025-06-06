{
  pkgs,
  lib,
  ...
}: let
  startTime = "00:00:00";
  endTime = "06:00:00";
  temperature = 3600;
in {
  home.packages = with pkgs; [
    hyprsunset
  ];

  # systemd.user = {
  #   services.hyprsunset = {
  #     Unit = {
  #       Description = "Apply blue light filter";
  #     };
  #     Service = {
  #       Type = "oneshot";
  #       ExecStart = "${lib.getExe pkgs.hyprsunset} -t ${toString temperature}";
  #     };
  #   };
  #   timers.hyprsunset = {
  #     Unit = {
  #       Description = "Apply blue light filter on schedule";
  #     };
  #     Timer = {
  #       OnCalendar = [
  #         "*-*-* ${endTime}"
  #         "*-*-* ${startTime}"
  #       ];
  #     };
  #     Install = {
  #       WantedBy = ["timers.target"];
  #     };
  #   };
  # };
}
