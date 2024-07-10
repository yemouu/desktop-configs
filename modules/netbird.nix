{ ... }: {
  environment.persistence."/data/persistent".directories = [ "/var/lib/netbird" ];
  services.netbird.tunnels.wt0.stateDir = "netbird";
}
