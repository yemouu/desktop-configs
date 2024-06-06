{ pkgs, ... }: {
  services = {
    desktopManager.plasma6.enable = true;
    xserver.enable = true; # Without this set plasma6 will fail to start even when using wayland
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    oxygen
    pkgs.aha
    plasma-browser-integration
    plasma-workspace-wallpapers
    qtvirtualkeyboard
  ];

  users.users.mou.packages = with pkgs; [ xwaylandvideobridge ];
}
