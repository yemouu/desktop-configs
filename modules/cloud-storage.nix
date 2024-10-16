{ pkgs, ... }: {
  users.users.mou.packages = with pkgs;[ seafile-client ];
}
