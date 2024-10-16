{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "microsoft-edge-stable" ];

  users.users.mou.packages = with pkgs; [ microsoft-edge ];
}
