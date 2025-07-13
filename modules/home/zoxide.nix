_: {
  # directory changer with memory, replaces cd, dirs, pop, push
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      options = [
        # "--cmd cd"
      ];
    };
  };
}
