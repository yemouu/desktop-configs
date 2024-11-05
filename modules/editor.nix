{ pkgs, ... }: {
  environment = {
    sessionVariables = {
      EDITOR = "kak";
      VISUAL = "kak";
    };
    systemPackages = with pkgs; [
      file
      (kakoune-unwrapped.overrideAttrs (finalAttrs: prevAttrs: {
        patches = (prevAttrs.patches or [ ]) ++ [
          (pkgs.fetchpatch {
            url = "https://patch-diff.githubusercontent.com/raw/mawww/kakoune/pull/5183.patch";
            hash = "sha256-XEU9pJybAuVuh+/euL6UY+65reXeUUbI2vvI/4Ao9ug=";
          })
        ];
      }))
    ];
  };

  users.users.mou.packages = with pkgs; [ kakoune-lsp ];
}
