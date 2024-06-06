{ pkgs, yemou-scripts, ... }: {

  nixpkgs.overlays = [ yemou-scripts.overlays.default ];

  environment.pathsToLink = [ "/share/xsessions" "/share/wayland-sessions" ];

  xdg = {
    mime.enable = true;
    icons.enable = true;
  };

  qt.enable = true;

  security.polkit.enable = true;

  services = {
    dbus.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      wayland.enable = true;
      enable = true;
    };
    flatpak.enable = true;
    geoclue2.enable = true;
    xserver.wacom.enable = true;
  };

  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  users.users.mou.packages = with pkgs; [
    foot
    keepassxc
    mpv
    syncthing
    thm
    wl-clipboard
    xdg-user-dirs
  ];
}
