{ pkgs, ... }: {
  environment = {
    sessionVariables = {
      EDITOR = "kak";
      VISUAL = "kak";
    };
    systemPackages = with pkgs; [ file kakoune-unwrapped ];
  };

  users.users.mou.packages = with pkgs; [ kakoune-lsp ];
}
