{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [ "steam" "steam-original" "steam-run" ];

  services.udev.packages = with pkgs; [ game-devices-udev-rules ];

  programs = {
    gamemode.enable = true;
    gamescope = {
      enable = true;
      args = [
        "--rt"
        "--adaptive-sync"
        "-w 2560"
        "-h 1080"
        "-f"
      ];
      # this option currently doesn't work when running inside of steam likely due to bubblewrap
      # capSysNice = true;
    };
    steam.enable = true;
  };

  users.users.mou = {
    extraGroups = [ "gamemode" ];
    packages = with pkgs; [
      r2modman
      superTuxKart
    ];
  };
}
