{lib, ...}: {
  # Database for aiding terminal-based programs
  environment.enableAllTerminfo = true;
  # Enable firmware with a license allowing redistribution
  hardware.enableRedistributableFirmware = true;

  # This should be handled by config.security.pam.sshAgentAuth.enable
  security.sudo.extraConfig = ''
    Defaults lecture = never # rollback results in sudo lectures after each reboot, it's somewhat useless anyway
  '';

  i18n.defaultLocale = lib.mkDefault "en_IL";
  time.timeZone = lib.mkDefault "Asia/Jerusalem";
}
