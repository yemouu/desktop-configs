{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "steam" "steam-original" "steam-run" ];

  services.udev.packages = with pkgs; [ game-devices-udev-rules ];

  programs = {
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam.enable = true;
  };

  users.users.mou = {
    extraGroups = [ "gamemode" ];
    packages = with pkgs; [ r2modman superTuxKart ];
  };
}
