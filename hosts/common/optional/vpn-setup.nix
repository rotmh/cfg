{
  # This doesn't work. What we need to do after starting the VPN,
  # is to disable IPv6 on the local inteface (`wifi` type).
  #
  #   nmcli connection modify <NAME> ipv6.method ignore
  #   nmcli connection down <NAME>
  #   nmcli connection up <NAME>
  networking.enableIPv6 = false;

  # We don't want to use local DNS servers, in order to hide our identity.
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];
  networking.networkmanager.dns = "none";
  services.resolved.enable = false;
}
