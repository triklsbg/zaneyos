{
  pkgs,
  inputs,
  username,
  host,
  profile,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        profile
        ;
    };
    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
      };
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    group = "gtom";
    uid   = 1010;
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jane = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  users.users.tomtest = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # create groups with <name> and <guid>
  users.groups."gtom".gid = 1020;
  users.groups."gtest".gid = 1030;

  users.users.tomtom1 = {
    # shell = pkgs.bash;
    shell = pkgs.zsh;
    isNormalUser = true;
    uid = 1014;
    group = "gtom";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    ignoreShellProgramCheck = true;
  };

  nix.settings.allowed-users = [ "${username}" ];
}
