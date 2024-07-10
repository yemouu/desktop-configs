{ config, ... }: {
  home = {
    username = "mou";
    homeDirectory = "/home/${config.home.username}";
  };

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/misc/.desktop";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/dls";
      music = "${config.home.homeDirectory}/aud";
      pictures = "${config.home.homeDirectory}/pics";
      publicShare = "${config.home.homeDirectory}/misc/.public";
      templates = "${config.home.homeDirectory}/misc/.templates";
      videos = "${config.home.homeDirectory}/vids";
    };
  };

  fonts.fontconfig.enable = true;
  # Fix shell scripts to use full paths and then replace this
  # Bring it back once we get a sessionPrependPath or something similar
  # home.sessionPath = [ "${config.home.homeDirectory}/misc/exes" ];
  home.sessionVariables = {
    ENV = "${config.xdg.configHome}/loksh/rc";
    HISTCONTROL = "ignoredups:ignorespace";
    HISTFILE = "${config.xdg.cacheHome}/loksh_history";
    PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
    SLURP_ARGS = "-b 00000040 -w 0";
  };

  home.stateVersion = "24.05";
}
