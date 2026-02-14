{ ... }:{
  networking = {
    domain = "chamomile.icu";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 8080 2053 ];
    };
  };

  services.tailscale.enable = true;
}

