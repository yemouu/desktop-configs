{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [ nixd nixpkgs-fmt ];
}
