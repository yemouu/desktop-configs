{ ... }: {
  environment.persistence."/data/persistent".directories = [ "/var/lib/flatpak" ];
  services.flatpak.enable = true;
}
