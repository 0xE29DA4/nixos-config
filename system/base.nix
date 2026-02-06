{ config, lib, pkgs, ... }: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;

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

  environment.systemPackages = with pkgs; [
    zip unzip
    wget curl tailscale dnsutils
    tree fd ripgrep
    neovim
    htop fastfetch tealdeer
    git mkcert
    sops ssh-to-age
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.enable = true;
}
