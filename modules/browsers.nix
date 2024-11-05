{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "microsoft-edge" ];

  users.users.mou.packages = with pkgs; [ microsoft-edge ];
}
