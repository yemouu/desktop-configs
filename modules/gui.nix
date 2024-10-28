{ pkgs, yemou-scripts, ... }: {
  nixpkgs.overlays = [ yemou-scripts.overlays.default ];

  environment.pathsToLink = [ "/share/xsessions" "/share/wayland-sessions" ];

  systemd.tmpfiles.rules = [ "C+ /usr/share/wallpapers - - - 1d /home/mou/misc/syncthing/media/images/wallpapers" ];

  xdg = {
    mime.enable = true;
    icons.enable = true;
  };

  qt.enable = true;

  security.polkit.enable = true;

  services = {
    dbus.enable = true;
    desktopManager.plasma6.enable = true;
    geoclue2.enable = true;
    xserver.wacom.enable = true;
  };

  programs = {
    dconf.enable = true;
    regreet = {
      enable = true;
      cageArgs = [ "-s" "-m" "last" ];
      font = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };
      settings.background = {
        path = "/usr/share/wallpapers/dark/evie-s-eS5hOjf9wwg-unsplash.jpg";
        fit = "Cover";
      };
    };
    river = {
      enable = true;
      extraPackages = with pkgs; [ bemenu swaylock ];
    };
    xwayland.enable = true;
  };

  # System-wide packages
  environment. systemPackages = with pkgs; [ adwaita-icon-theme ];

  # Per-user packages
  users.users.mou.packages = with pkgs; [
    foot
    mpv
    syncthing
    thm
    wl-clipboard
    xdg-user-dirs
  ];
}
