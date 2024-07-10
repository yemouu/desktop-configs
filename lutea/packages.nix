{ pkgs, ... }: {
  programs.virt-manager.enable = true;
  users.users.mou.packages = with pkgs; [ intel-gpu-tools ];
}
