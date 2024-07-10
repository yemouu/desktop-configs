{ pkgs, ... }: {
  users.users.mou.packages = [ pkgs.ruff pkgs.python3Packages.ruff-lsp ];
}
