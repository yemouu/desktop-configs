# TODO: Deduplicate
{ ... }:
let
  # TODO: make these options
  disk = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67";
  homeDir = "/home/mou";
in
{
  fileSystems = {
    "/home/mou/aud" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/aud" "compress=zstd" "discard=async" ];
    };
    "/home/mou/.cache" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/cache" "compress=zstd" "discard=async" ];
    };
    "/home/mou/.config" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/config" "compress=zstd" "discard=async" ];
    };
    "/home/mou/dls" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/dls" "compress=zstd" "discard=async" ];
    };
    "/home/mou/doc" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/doc" "compress=zstd" "discard=async" ];
    };
    "/home/mou/.local" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/local" "compress=zstd" "discard=async" ];
    };
    "/home/mou/misc" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/misc" "compress=zstd" "discard=async" ];
    };
    "/home/mou/pic" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/pic" "compress=zstd" "discard=async" ];
    };
    "/home/mou/vid" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@home/mou/vid" "compress=zstd" "discard=async" ];
    };
  };

  systemd.tmpfiles.rules = [
    "d ${homeDir}/dls - mou mou 7d -"
    "d ${homeDir}/.cache - mou mou 14d -"
    "x ${homeDir}/.cache/nix/tarball-cache/.git - - - 14d -"
    "L ${homeDir}/.var - - - - ${homeDir}/misc/.app-data/flatpak-var"
    "L ${homeDir}/.ssh - - - - ${homeDir}/misc/.app-data/ssh"
  ];
}
