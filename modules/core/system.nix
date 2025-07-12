{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) consoleKeyMap;
in
{
  nix = {
    settings = {
      download-buffer-size = 250000000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
  time.timeZone = "Europe/Berlin"; # trikl
  i18n.defaultLocale = "de_DE.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  environment.variables = {
    ZANEYOS_VERSION = "2.3.1";
    ZANEYOS = "true";
  };
  environment.shellAliases = {
    # list all installed packages
    nixpkgs_me = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq ";
    # trikl: touches all shells ...
    all = "alias | rg "; # search for a pattern in all aliases
    #
    ll = "ls -l";
    la = "ls -a";
    update = "sudo nixos-rebuild switch";
    gst = "git status";
    gil = "git log";
    gbra = "git branch -av";
    gif = "git diff";
    rghl = "rg --hidden --follow ";
    rghu = "rg --hidden --no-ignore --follow ";
    maintain_alias = " in ..core/system.nix ";
    #
    # rem_xxx to remember things
    rem_fish_keybinds = "bind ";
    rem_zsh_keybinds = "bindkey -L ";
    rem_bash_keybinds = "bind -p";
    #
    rem_zell = "zellij action new-tab --cwd ~/projects/my-project";
    rem_zel2 = "zellij action new-tab --command /bin/zsh";
    rem_nixfmt = "find . -type f -name '*.nix' -exec nixfmt {} ";
  };

  # services.xserver.xkb.extraLayouts = {
  #   gb-trikl = {
  #     description = "Englisch mit Umlauten a,u,o ";
  #     languages = ["eng"];
  #     symbolsFile = ../../../xkb/gb-trikl.xkb;
  #   };
  # };

  console.keyMap = "${consoleKeyMap}";
  system.stateVersion = "23.11"; # Do not change!
}
