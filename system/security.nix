{config, ...}: {
  sops.defaultSopsFile = ../secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
  sops.secrets.root-password = {
    neededForUsers = true;
  };
  sops.secrets.chamomile-password = {
    neededForUsers = true;
  };

  security.sudo.wheelNeedsPassword = true;
}
