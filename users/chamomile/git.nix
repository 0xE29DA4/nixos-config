{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "me@chamomile.icu";
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
