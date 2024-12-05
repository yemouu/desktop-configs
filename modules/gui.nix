{ pkgs, yemou-scripts, ... }: {
  nixpkgs.overlays = [
    yemou-scripts.overlays.default
    (final: prev: {
      wf-recorder = prev.wf-recorder.overrideAttrs (finalAttrs: prevAttrs: {
        patches = (prevAttrs.patches or [ ]) ++ [
          (prev.fetchpatch {
            url = "https://github.com/ammen99/wf-recorder/commit/560bb92d3ddaeb31d7af77d22d01b0050b45bebe.patch";
            hash = "sha256-7jbX5k8dh4dWfolMkZXiERuM72zVrkarsamXnd+1YoI=";
          })
        ];
      });
    })
  ];

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.river = {
        default = lib.mkForce "gtk";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
        "org.freedesktop.impl.portal.Inhibit" = "none";
      };
    };
    mime.enable = true;
    icons.enable = true;
  };

  qt.enable = true;

  security.polkit.enable = true;

  services = {
    dbus.enable = true;
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
      package = pkgs.river.overrideAttrs (final: prev: {
        postInstall = ''
          echo 'DesktopNames=river;wlroots' >> contrib/river.desktop
        '' + prev.postInstall;
      });
      extraPackages = with pkgs; [
        bemenu
        chayang
        kanshi
        mako
        nautilus
        scr
        slurp
        swaybg
        swayidle
        swaylock
        waybar
        wlopm
        wlsunset
      ];
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
    zathura
  ];
}
