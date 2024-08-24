{ lib, pkgs, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernel.sysctl."vm.max_map_count" = 2147483642;
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        consoleMode = "auto";
        enable = true;
      };
      timeout = 0;
    };
    supportedFilesystems = [ "ntfs" ];
    tmp.useTmpfs = true;
  };

  zramSwap.enable = true;

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "mode=755" ];
    };
    "/data" = {
      device = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67";
      fsType = "btrfs";
      options = [ "subvol=@nixos/data" "compress=zstd" "discard=async" ];
      neededForBoot = true;
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67";
      fsType = "btrfs";
      options = [ "subvol=@nixos/nix" "compress=zstd" "discard=async" ];
    };
    "/config" = {
      device = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67";
      fsType = "btrfs";
      options = [ "subvol=@nixos/config" "compress=zstd" "discard=async" ];
    };
    "/home/mou" = {
      device = "/dev/disk/by-uuid/7bf830d4-189d-4e9b-bcb0-565f4ac69e67";
      fsType = "btrfs";
      options = [ "subvol=@home/mou" "compress=zstd" "discard=async" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/862D-85DB";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" "defaults" ];
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    cpu.intel.updateMicrocode = true;
    uinput.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ intel-media-driver ];
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
