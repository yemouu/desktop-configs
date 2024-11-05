{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [ inkscape ];
}
