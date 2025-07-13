#
# this-hardware-conf.nix
#
# hardware config for this specific nixos instance: 1st partition
#
# prefer /dev/disk/by-label/<label> identifiers
#
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
  ];
  # boot.initrd.kernelModules = [ "nvidia" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.swraid.enable = false;

  # more hardware
  # hardware.cpu.amd.updateMicrocode = true;
  # hardware.enableAllFirmware = true;

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/A52E-4449";
  #     fsType = "vfat";
  #   };
  # this copies all kernels to the efi device which is not useful
  # for multiboot environments. BETTER /efi as mount point

  # mount efi partition under /efi instead /boot. Despite the partition is labeled as "boot"
  fileSystems."/efi" = {
    device = "/dev/disk/by-uuid/A52E-4449";
    fsType = "vfat";
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-label/ff5_data";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/vbox" = {
    device = "/dev/disk/by-label/ff6_vbox";
    fsType = "ext4";
    # fsType = "auto";
    options = [ "nofail" ];
    # example for mount options
    # options = [ "defaults" "user" "rw" "utf8" "noauto" "umask=000" ];
  };

  # main archlinux installation on partition 4
  fileSystems."/pp/ff4" = {
    device = "/dev/disk/by-label/ff4_arch";
    fsType = "ext4";
    options = [ "nofail" ];
  };
  #
  # fileSystems."/partitions/ff7_nixos" = {
  #   device = "/dev/disk/by-label/ff7_nixos";
  #   fsType = "ext4";
  # };
  #
  # fileSystems."/partitions/ff8_endos" = {
  #   device = "/dev/disk/by-label/ff8_endos";
  #   fsType = "ext4";
  #   options = [ "nofail" ];
  # };

  #
  fileSystems."/pp/ff9_nixos" = {
    device = "/dev/disk/by-label/ff9_nixos";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/pp/ff11" = {
    device = "/dev/disk/by-label/ff11_black";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault false;
  networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  # for displays >200 dpi
  # hardware.video.hidpi.enable = lib.mkDefault true;
  # fonts.optimizeForVeryHightDPI.enable = lib.mkDefault true;
}
