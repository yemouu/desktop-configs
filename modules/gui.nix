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
    geoclue2.enable = true;
    xserver.wacom.enable = true;
    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -tr --remember-session";
        user = "greeter";
      };
    };
  };

  programs = {
    dconf.enable = true;
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
    thm
    wl-clipboard
    xdg-user-dirs
  ];
}
