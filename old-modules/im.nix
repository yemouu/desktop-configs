{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "zoom" ];

  users.users.mou.packages = with pkgs; [ zoom-us ];
}
