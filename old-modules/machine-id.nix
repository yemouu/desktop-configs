{ config, ... }: {
  # This needs to be world readable
  sops.secrets."machine-id".mode = "0444";
  environment.etc."machine-id".source = config.sops.secrets."machine-id".path;
}
