{ ... }: {
  nix = {
    optimise.automatic = true;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      use-xdg-base-directories = true;
    };
  };
}
