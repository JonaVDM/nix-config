{
  description = "Jona's flakes or something like that";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
    in
    {
    nixosConfigurations = {
      # Home PC
      "white" = nixpkgs.lib.nixosSystem {
        system = "x86_65-linux";

        specialArgs = { inherit inputs; };
        modules = [ 
	        ./hosts/white_home_pc/configuration.nix 
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
