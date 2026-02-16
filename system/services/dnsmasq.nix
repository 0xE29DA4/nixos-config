{...}: {
  services.dnsmasq = {
    enable = true;

    settings = {
      interface = "tailscale0";
      bind-interfaces = true;
      no-resolv = true;
      server = [
        "183.60.83.19"
        "183.60.82.98"
        "223.5.5.5"
      ];
      cache-size = 1000;
      domain-needed = true;
      bogus-priv = true;
      domain = "vpn.chamomile.icu";
      local = "/vpn.chamomile.icu/";
      log-queries = true;
      log-facility = "/var/log/dnsmasq.log";
      address = [
        "/vpn.chamomile.icu/100.111.111.11"
        "/turing.vpn.chamomile.icu/100.111.111.22"
        "/ivy.vpn.chamomile.icu/100.111.111.33"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "f /var/log/dnsmasq.log 0644 dnsmasq dnsmasq -"
  ];
}
