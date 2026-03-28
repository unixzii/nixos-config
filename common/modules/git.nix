{
  programs.git = {
    enable = true;
    settings = {
      init.defaultbranch = "main";
      user = {
        name = "Cyandev";
        email = "unixzii@gmail.com";
        signingkey = "E8CCA4092129E43E";
      };
      commit.gpgsign = true;
      pull = {
        ff = "only";
        rebase = true;
      };
      rebase.autostash = true;
    };
  };
}
