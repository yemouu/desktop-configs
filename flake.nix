{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    yemou-scripts = {
      url = "git+https://codeberg.org/yemou/scripts";
      # url = "path:/home/mou/misc/repos/scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, sops-nix, home-manager, ... }@inputs:
    let genSystemConfigs = nixpkgs.lib.genAttrs [ "lutea" ]; in {
      nixosConfigurations = genSystemConfigs (hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
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
