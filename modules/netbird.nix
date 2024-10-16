{ pkgs, ... }: {
  environment.persistence."/data/persistent".directories = [ "/var/lib/netbird" ];
  services.netbird.tunnels.wt0.stateDir = "netbird";
  users.users.mou.packages = with pkgs; [ netbird-ui ];
}
