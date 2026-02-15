{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      # or "agnoster", "powerlevel10k", etc...
      theme = "powerlevel10k";
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
      eval "$(direnv hook zsh)"
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

  programs.fastfetch.enable = true;
  home.sessionVariables.FASTFETCH_SHOW_ON_LOGIN = "1";
  home.file.".zprofile".text = ''
    if [ -n "$PS1" ] && [ -n "$FASTFETCH_SHOW_ON_LOGIN" ]; then
      fastfetch
      unset FASTFETCH_SHOW_ON_LOGIN
    fi
  '';
}
