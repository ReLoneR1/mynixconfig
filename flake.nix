{
  description = "reloner flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
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

  outputs = { self, nixpkgs, home-manager, nixvim, yandex-music }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.reloner = import ./home/home.nix;
          home-manager.sharedModules = [
            nixvim.homeManagerModules.nixvim
          ];
        }
        yandex-music.nixosModules.default
      ];
    };
  };
}
