{...}: {
  networking = {
    domain = "chamomile.icu";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        # SSH
        22
        # Nginx
        80
        443
        # tmp
        8080
        5244
        25
        80
        110
        143
        465
        587
        993
        995
      ];
      allowedUDPPorts = [
        # tmp
        7359
      ];
    };
  };

  services.tailscale.enable = true;
}
