{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "microsoft-edge-stable" ];

  programs.firefox.enable = true;
  users.users.mou.packages = with pkgs; [ microsoft-edge ];
}
