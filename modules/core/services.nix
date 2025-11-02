{ profile, pkgs, ... }:
{
  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    # fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    openssh.enable = true; # Enable SSH
    # blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    # gnome.gnome-keyring.enable = true;

    smartd = {
      enable = if profile == "vm" then false else true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  services.locate = {
    enable = true;
    prunePaths = [
      "/nix/var/log/nix"
      "/vbox/github/nixpkgs"
      "/pp/ff9_nixos"
      # allow /pp/ff4 to be indexed
    ];
    pruneNames = [
      ".jj"
      ".git"
      ".cache"
    ];
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.samsung-unified-linux-driver ];

}
