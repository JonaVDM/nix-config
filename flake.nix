{
  description = "Jona's flakes or something like that";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-sn.url = "github:nixos/nixpkgs/staging-next";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
    };
  };
}
