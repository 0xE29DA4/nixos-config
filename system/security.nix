{config, ...}: {
  sops = {    
    defaultSopsFile = ../secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets.root-password = {
      neededForUsers = true;
    };
    secrets.chamomile-password = {
      neededForUsers = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
