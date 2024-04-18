{
  description = "Jona's flakes or something like that";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-sn.url = "github:nixos/nixpkgs/staging-next";
    nix-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-hardware, ... }@inputs:
  let
    inherit (self) outputs;
  in
  {
    overlays = import ./overlays.nix { inherit inputs; };
    nixosConfigurations = {
      # Home PC
      "ganymede" = nixpkgs.lib.nixosSystem {
        system = "x86_65-linux";

        specialArgs = { inherit inputs outputs; };
        modules = [
	        ./hosts/ganymede_home_pc/configuration.nix
	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jona = import ./home;
          }
        ];
      };

      # Work laptop
      "deimos" = nixpkgs.lib.nixosSystem {
        system = "x86_65-linux";

        specialArgs = { inherit inputs outputs; };
        modules = [
	        ./hosts/deimos_work/configuration.nix
	        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jona = import ./home;
          }
        ];
      };

      # A build specifically for the pi
      # WIP - Not functoinal yet
      "arm_iso" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          # nix-hardware.nixosModules.raspberry-pi-4
	        ./hosts/iso/arm.nix
        ];
      };
    };
  };
}
