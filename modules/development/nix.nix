{pkgs, ...}: {
  users.users.mou.packages = with pkgs; [ nil nixpkgs-fmt ];
}
