{ config, pkgs, ... }: {
  sops.secrets = {
    "passwordHashes/root".neededForUsers = true;
    "passwordHashes/mou".neededForUsers = true;
  };

  time.timeZone = "America/New_York";

  environment = {
    loginShellInit = ''
      if [ -e "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" ]
      then . "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
      fi
    '';
    persistence."/data/persistent" = {
      hideMounts = true;
      directories = [
        "/var/log"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        { directory = "/var/lib/private"; mode = "0700"; }
      ];
      files = [ "/etc/machine-id" ];
    };
    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
    systemPackages = with pkgs; [
      git
      htop
      lsof
      man-pages
      man-pages-posix
      age # Needed for sops-nix
      sops # Needed for sops-nix
      magic-wormhole-rs # General useful tool
    ];
  };

  services = {
    acpid.enable = true;
    smartd.enable = true;
  };

  users = {
    groups.mou.gid = 1000;
    users = {
      root.hashedPasswordFile = config.sops.secrets."passwordHashes/root".path;
      mou = {
        isNormalUser = true;
        group = "mou";
        extraGroups = [ "users" "wheel" ];
        shell = pkgs.loksh;
        hashedPasswordFile = config.sops.secrets."passwordHashes/mou".path;
      };
    };
  };
}
