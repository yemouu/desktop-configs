{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    tinymist
    typst
    typstyle
  ];
}
