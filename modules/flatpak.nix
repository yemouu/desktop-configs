{ nixpkgs-ostree, ... }: {
  environment.persistence."/data/persistent".directories = [ "/var/lib/flatpak" ];

  nixpkgs.overlays = [
    (final: prev: {
      inherit (nixpkgs-ostree.legacyPackages.${prev.system}) ostree;
    })
  ];

  services.flatpak.enable = true;
}
