{ config, pkgs, ... }: {
  # Home Manager 基础配置
  programs.home-manager.enable = true;
  home.username = "chamomile";
  home.homeDirectory = "/home/chamomile";
  home.stateVersion = "25.11";
  home.sessionVariables = {
  };

  # 用户软件包
  home.packages = with pkgs; [
    bun
  ];

  # Git 配置
  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "0xE29DA4@gmail.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };

  # Zsh 配置
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      # 或者 "agnoster", "powerlevel10k", etc...
      theme = "robbyrussell";
      plugins = [
        "git"
        # 按两下 ESC 自动加 sudo
        "sudo"
        # 补全命令
        "command-not-found"
      ];
    };
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
    # 额外的 .zshrc 内容
    initContent = ''
      export EDITOR=nvim
    '';
    # 历史记录配置
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };
  };

  # Starship 提示符
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
      success_symbol = "[➜](<bold green>)";
      error_symbol = "[✗](<bold red>)";
    };
  };
};

  # 在 shell 初始化时执行 fastfetch
  programs.fastfetch.enable = true;
  home.sessionVariables.FASTFETCH_SHOW_ON_LOGIN = "1";
  home.file.".zprofile".text = ''
    if [ -n "$PS1" ] && [ -n "$FASTFETCH_SHOW_ON_LOGIN" ]; then
      fastfetch
      unset FASTFETCH_SHOW_ON_LOGIN
    fi
  '';
}
