{ config, lib, pkgs, ... }: {
  # 系统基础配置
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;

  # 本地化配置
  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };
  fonts.packages = with pkgs; [
    wqy_zenhei
    wqy_microhei
    # Maple Mono (Ligature TTF unhinted)
    maple-mono.truetype
    # Maple Mono NF (Ligature unhinted)
    maple-mono.NF-unhinted
    # Maple Mono NF CN (Ligature unhinted)
    maple-mono.NF-CN-unhinted
  ];

  # 用户与权限
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
  security.sudo.wheelNeedsPassword = true;

  environment.systemPackages = with pkgs; [
    # 压缩工具
    zip unzip
    # 网络工具
    wget curl
    # 文件工具
    tree fd ripgrep
    # 编辑器
    neovim
    # 系统工具
    htop fastfetch tealdeer
    # 开发工具
    git mkcert
    # 加密工具
    sops ssh-to-age
  ];

  # 程序与软件包
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.enable = true;
}
