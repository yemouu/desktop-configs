{ pkgs, ... }: {
  # nixpkgs.config.permittedInsecurePackages = [ ];
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     # TODO: check if this is available upstream and if it isn't try and upstream it
  #     ffmpegthumbnailer = prev.ffmpegthumbnailer.overrideAttrs (finalAttrs: prevAttrs: {
  #       postPatch = prevAttrs.postPatch + ''
  #         substituteInPlace ./dist/ffmpegthumbnailer.thumbnailer \
  #           --replace ffmpegthumbnailer $out/bin/ffmpegthumbnailer
  #       '';
  #     });
  #   })
  # ];
  # system.replaceRuntimeDependencies = [ ({ }) ];

  programs.virt-manager.enable = true;
  users.users.mou.packages = with pkgs; [ intel-gpu-tools ];
}
