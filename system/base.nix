{pkgs, ...}: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;
  environment.systemPackages = with pkgs; [
    # basic
    cron
    openssl
    sops
    ssh-to-age
    # nix
    nh
    # find and locate
    fd
    ripgrep
    # disk and file
    duf
    dust
    # process and jobs
    btop
    procs
    # system info and status
    fastfetch
    lm_sensors
    usbutils
    pciutils
    hw-probe
    # archieve
    xz
    zip
    unzip
    gzip
    bzip2
    zstd
    # network
    mtr
    frp
    wget
    curl
    nmap
    rsync
    tcpdump
    tailscale
    doggo
    iproute2
    dnsutils
    wireguard-tools
    # text preview and extraction
    bat
    # development
    colordiff
    delta
    direnv
    mkcert
    tealdeer
    kubectl
    # misc
    tree
    eza
    jq
    yq-go
    fzf
    yazi
    zellij
  ];

  programs.zsh.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
