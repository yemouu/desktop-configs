{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    impermanence.url = "github:nix-community/impermanence";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yemou-scripts = {
      url = "git+https://codeberg.org/yemou/scripts";
      # url = "path:/data/local-flakes/scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, impermanence, sops-nix, home-manager, ... }@inputs:
    let genSystemConfigs = nixpkgs.lib.genAttrs [ "lutea" ]; in {
      nixosConfigurations = genSystemConfigs (hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
            impermanence.nixosModules.impermanence
            ./${hostname}/config.nix
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = inputs;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.mou = import ./${hostname}/home.nix;
              };
            }
          ];
        });
    };
}
