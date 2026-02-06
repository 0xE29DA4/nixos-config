{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "0xE29DA4@gmail.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
