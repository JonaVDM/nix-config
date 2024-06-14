{
  description = "Jona's flakes or something like that";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-sn.url = "github:nixos/nixpkgs/staging-next";
    nix-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-generators, nix-hardware, ... }@inputs:
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

    packages.x86_64-linux.pi-img = nixos-generators.nixosGenerate {
      system = "aarch64-linux";
      format = "sd-aarch64";

      modules = [
        nix-hardware.nixosModules.raspberry-pi-4
        ./hosts/iso/pi.nix
      ];
    };
  };
}
