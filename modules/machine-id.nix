{ config, ... }: {
  sops.secrets."machine-id" = { };
  environment.etc."machine-id".source = config.sops.secrets."machine-id".path;
}
