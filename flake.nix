{
  description = "reloner flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yandex-music.url = "github:cucumber-sp/yandex-music-linux";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          { boot.kernelPackages = pkgs-unstable.linuxPackages_latest; }
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.reloner = import ./home/home.nix;
            home-manager.sharedModules = [
              inputs.nixvim.homeManagerModules.nixvim
            ];
          }
          inputs.yandex-music.nixosModules.default
        ];
        specialArgs = { inherit pkgs-unstable; };
      };
    };
  };
}
