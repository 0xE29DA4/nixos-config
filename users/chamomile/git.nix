{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Chamomile Tea";
      user.email = "me@chamomile.icu";
      core.editor = "nvim";
      core.pager = "delta --paging=always";
      init.defaultBranch = "main";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      delta.light = false;
      delta.side-by-side = true;
      delta.line-numbers = true;
      delta.features = "decorations";
      merge.conflictstyle = "zdiff3";
      alias.dd = "!git difftool -y --extcmd='difft --display side-by-side'";
    };
  };
}
