{ nixpkgs, pkgs, ... }: {
  systemd = {
    services.nix-daemon.environment.TMPDIR = "/nix/tmp";
    tmpfiles.rules = [ "d /nix/tmp - root root 1d" ];
  };

  users.users.mou.packages = [
    (pkgs.symlinkJoin {
      name = "nixos-rebuild-tmpdir";
      paths = [ pkgs.nixos-rebuild ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/nixos-rebuild \
          --set TMPDIR /nix/tmp
      '';
    })
  ];

  nix = {
    nixPath = [ "nixpkgs=${nixpkgs}" ];
    optimise.automatic = true;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 134217728;
      experimental-features = [ "nix-command" "flakes" ];
      keep-going = true;
      use-xdg-base-directories = true;
    };
  };
}
