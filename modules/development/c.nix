{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    bear
    clang-tools
    gdb
  ];
}
