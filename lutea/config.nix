{ ... }: {
  imports = [
    ./hardware.nix
    ./packages.nix
    ../modules/audio.nix
    ../modules/basic.nix
    ../modules/browsers.nix
    ../modules/creation.nix
    ../modules/development
    ../modules/editor.nix
    ../modules/flatpak.nix
    ../modules/fonts.nix
    ../modules/games.nix
    ../modules/gui.nix
    ../modules/hardware-keys.nix
    ../modules/im.nix
    ../modules/kde.nix
    ../modules/netbird.nix
    ../modules/nix.nix
    ../modules/printing.nix
  ];

  sops = {
    defaultSopsFile = ../secrets/lutea.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/data/keys.txt";
  };

  networking.hostName = "lutea";
  services.thermald.enable = true;
  users.users.mou.extraGroups = [ "libvirtd" ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older
  # NixOS versions. Most users should NEVER change this value after the initial install, for any
  # reason, even if you've upgraded your system to a new NixOS release. This value does NOT affect
  # the Nixpkgs version your packages and OS are pulled from, so changing it will NOT upgrade your
  # system. This value being lower than the current NixOS release does NOT mean your system is out
  # of date, out of support, or vulnerable. Do NOT change this value unless you have manually
  # inspected all the changes it would make to your configuration, and migrated your data
  # accordingly. For more information, see `man configuration.nix` or
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
