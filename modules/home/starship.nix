{ pkgs, ... }:
{
  programs.starship = {
    enable = false;
    package = pkgs.starship;  # trikl??? TODO unneccesary nonsense
  };
}
