{inputs, ...}: {
  networking = {
    wireless.networks = builtins.listToAttrs (map (wifi: {
        name = wifi.name;
        value =
          if builtins.hasAttr "hidden" wifi
          then {
            hidden = wifi.hidden;
            psk = wifi.pass;
          }
          else {
            psk = wifi.pass;
          };
      })
      inputs.nix-secrets.network.wifi);
  };
}
