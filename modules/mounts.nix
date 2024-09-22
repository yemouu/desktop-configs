{ ... }: {
  fileSystems = let disk = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67"; in {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "mode=755" ];
    };
    "/data" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@nixos/data" "compress=zstd" "discard=async" ];
      neededForBoot = true;
    };
    "/nix" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@nixos/nix" "compress=zstd" "discard=async" ];
    };
    "/config" = {
      device = disk;
      fsType = "btrfs";
      options = [ "subvol=@nixos/config" "compress=zstd" "discard=async" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/862D-85DB";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" "defaults" ];
    };
  };
}
