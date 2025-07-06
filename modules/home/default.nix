{ host, profile, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in
{
  imports = [
    ./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fzf.nix
    ./gh.nix
    # ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./lazygit.nix
    ./nvf.nix # neovim things
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./virtmanager.nix
    # ./vscode.nix
    waybarChoice
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./zsh
  ];

  home.sessionVariables = {
    # start_copy  ala trikl
    # EDITOR = "emacs";
    ### EDITOR = "${pkgs.helix}/bin/hx";
    # overwrite questionable/not_understood presettings
    LESS = " --quit-if-one-screen --jump-target=6 --RAW-CONTROL-CHARS";
    # MANPAGER = "moar";    # can't get nice color theme in moar for man pages
    ### MOAR = " --quit-if-one-screen --style=monokai --no-clear-on-exit ";

    #
    # MANPAGER = "nvim +Man!";
    MANPAGER = "sh -c 'col -bx | bat --language man --plain'";
    MANROFFOPT = "-c"; # according to https://github.com/sharkdp/bat#man
    # --language man means man-pages
    # --plain means no decorations

    DATA = "/data/tom";
    Sandbox = "$DATA/sandbox";
    # github cli gh is aware of this, detects it at "gh auth login"
    # end_copy
  };

  home.sessionPath = [
    "$HOME/.config/emacs/bin"    # to find doom executable
  ];

  home.shellAliases = {
    sv = "sudo nvim";
    v = "nvim";
    c = "clear";
    fr = "nh os switch --hostname ${profile}";
    fu = "nh os switch --hostname ${profile} --update";
    zuuuu = "sh <(curl -L https://gitlab.com/Zaney/zaneyos/-/releases/latest/download/install-zaneyos.sh)";
    ncguu = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    # cat = "bat";
    # man = "batman";  # trikl no man should be man
  };

}
