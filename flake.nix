{
  description = "ZaneyOS modified for trikl on ff1";

  inputs = {
    home-manager = {
      # url = "github:nix-community/home-manager/release-25.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    # stylix.url = "github:danth/stylix/release-25.05";
    stylix.url = "github:nix-community/stylix";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      #
      # system = "x86_64-linux";
      # host = "zaneyos-23-vm";
      # profile = "vm";
      # username = "dwilliams";
      #
      system = "x86_64-linux";
      host = "nixos";
      profile = "nvidia";
      username = "tom1";
    in
    {
      nixosConfigurations = {
        # amd = nixpkgs.lib.nixosSystem {
        #   inherit system;
        #   specialArgs = {
        #     inherit inputs;
        #     inherit username;
        #     inherit host;
        #     inherit profile;
        #   };
        #   modules = [./profiles/amd];
        # };
        nvidia = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
          };
          modules = [ ./profiles/nvidia ];
        };
        nvidia-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
          };
          modules = [ ./profiles/nvidia-laptop ];
        };
        intel = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
          };
          modules = [ ./profiles/intel ];
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
          };
          modules = [ ./profiles/vm ];
        };
      };
    };
}
