{ pkgs, ... }: {
  imports = [ ./unfree.nix ];
  unfree.allowed = [
    "modrinth-app"
    "modrinth-app-unwrapped"
    "steam"
    "steam-original"
    "steam-run"
    "steam-unwrapped"
  ];

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
    steam = {
      enable = true;
      extraPackages = with pkgs; [ adwaita-icon-theme ];
    };
  };

  users.users.mou = {
    extraGroups = [ "gamemode" ];
    packages = with pkgs; [
      modrinth-app
      r2modman
      superTuxKart
    ];
  };
}
