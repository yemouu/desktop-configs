{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    # dino
    # gajim
    # kaidan
    signal-desktop
    thunderbird
  ];
}
