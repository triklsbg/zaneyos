{
  # central definition of variables which are accessed/included by
  # a statement like:
  # 'inherit (import ../../hosts/${host}/variables.nix) consoleKeyMap;'
  # in some nix files of the config file tree
  #
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Th. Rikl";
  gitEmail = "workhorse.t@googlemail.com";

  # Hyprland Settings
  # ex "monitor=HDMI-A-1, 1920x1080@60,auto,1"
  # official docs say:
  # monitor = , preferred, auto, 10

  # trikl no extra MonitorSettings
  extraMonitorSettings = "
    monitor = Virtual-1, 1920x1080@60,auto,1
    ";

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "google-chrome-stable"; # Set Default Browser (google-chrome-stable for google-chrome)
  # terminal = "ghostty"; # Set Default System Terminal
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "gb-trikl"; # gb
  # ends up in the 'kb_layout = ' option in hyprland config
  # valid is also a comma separated list like "us,gb,jp"
  # or whatever you find with '$xkbcli list' "
  consoleKeyMap = "uk";

  # For Nvidia Prime support
  # intelID = "PCI:1:0:0";
  # nvidiaID = "PCI:0:2:0";

  # Enable NFS
  # enableNFS = true;
  enableNFS = false;

  # Enable Printing Support
  printEnable = true;

  # Set Stylix Image
  stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;

  # Set Waybar
  # Includes alternates such as:
  # Just uncomment the one you want and comment out the others

  #waybarChoice = ../../modules/home/waybar/Jerry-waybars.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-simple.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-curved.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-nekodyke.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  waybarChoice = ../../modules/home/waybar/waybar-ddubs-2.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (standard)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  # Just change the name after the - and rebuild
  animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
