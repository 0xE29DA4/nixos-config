{ ... }:{
  networking = {
    domain = "chamomile.icu";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
    };
  };
}
