{ pkgs, ... }: {
  environment = {
    sessionVariables = {
      EDITOR = "kak";
      VISUAL = "kak";
    };
    systemPackages = with pkgs; [ kakoune file ];
  };

  users.users.mou.packages = with pkgs; [ kak-lsp ];
}
