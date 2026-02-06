{ config, pkgs, ... }: {
  users.mutableUsers = false;

  users.users.root = {
    hashedPasswordFile = config.sops.secrets.chamomile-password.path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO0d2jhnvml0NpiNrSdEht/Jz0LB+sAvc6zvEG+kI6Vj hu260@Turing"
    ];
  };

  users.users.chamomile = {
    isNormalUser = true;
    description = "Chamomile Tea";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets.chamomile-password.path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO0d2jhnvml0NpiNrSdEht/Jz0LB+sAvc6zvEG+kI6Vj hu260@Turing"
    ];
  };
}
