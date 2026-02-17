{...}: {
  networking = {
    domain = "chamomile.icu";
    firewall = {
      enable = true;
      backend = "nftables";
      allowPing = true;
      allowedTCPPorts = [
        # SSH
        22
        # Nginx
        80
        443
        # openlist
        5244
        # immich
        2283
      ];
    };
    nftables = {
      enable = true;
    };
  };
}
