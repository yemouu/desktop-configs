{ config, pkgs, ... }: {
  sops. secrets = {
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
    systemPackages = with pkgs; [
      git
      htop
      lsof
      man-pages
      man-pages-posix
      age # Needed for sops-nix
      sops # Needed for sops-nix
      croc # General useful tool
    ];
    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
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
