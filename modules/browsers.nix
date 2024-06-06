{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "google-chrome" ];

  programs.firefox.enable = true;
  users.users.mou.packages = with pkgs; [ google-chrome ];
}
