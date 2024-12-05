{ pkgs, ... }: {
  users.users.mou.packages = with pkgs;[ nextcloud-client ];
}
