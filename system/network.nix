{...}: {
  networking = {
    domain = "ada.chamomile.icu";
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
      ];
    };
    nftables = {
      enable = true;
    };
  };
}
