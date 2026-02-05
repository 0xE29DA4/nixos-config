{ config, pkgs, ... }: {
  programs.home-manager.enable = true;
  home.username = "chamomile";
  home.homeDirectory = "/home/chamomile";
  home.stateVersion = "25.11";
  home.sessionVariables = {
  };
  home.packages = with pkgs; [
    bun
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "0xE29DA4@gmail.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      # or "agnoster", "powerlevel10k", etc...
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        "command-not-found"
      ];
    };
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
    initContent = ''
      export EDITOR=nvim
    '';
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };
  };

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

  # Show Fastfetch On Boot
  programs.fastfetch.enable = true;
  home.sessionVariables.FASTFETCH_SHOW_ON_LOGIN = "1";
  home.file.".zprofile".text = ''
    if [ -n "$PS1" ] && [ -n "$FASTFETCH_SHOW_ON_LOGIN" ]; then
      fastfetch
      unset FASTFETCH_SHOW_ON_LOGIN
    fi
  '';
}
