{
  lib,
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "me@chamomile.icu";
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };
}
