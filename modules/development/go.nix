{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    gopls
  ];
}
