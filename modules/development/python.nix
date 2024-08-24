{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [ ruff ruff-lsp ];
}
