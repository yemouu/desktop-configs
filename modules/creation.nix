{ pkgs, ... }: {
  users.users.mou.packages = with pkgs; [
    blender
    inkscape
  ];
}
