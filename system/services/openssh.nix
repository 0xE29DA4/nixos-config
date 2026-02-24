{...}: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
      AllowUsers = ["chamomile"];
      ClientAliveInterval = 60;
      ClientAliveCountMax = 3;
      TCPKeepAlive = "yes";
    };
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };
}
