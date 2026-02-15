{ ... }:{
  networking = {
    domain = "chamomile.icu";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 8080 5244 25 80 110 143 465 587 993 995 ];
      allowedUDPPorts = [ 7359 ];
    };
  };

  services.tailscale.enable = true;
}

