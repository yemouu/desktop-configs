{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
  ];
}
