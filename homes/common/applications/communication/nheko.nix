{pkgs, ...}: {
  home = {
    packages = with pkgs; [nheko];

    persistence."/nix/persist/home/ttecho".directories = [".config/nheko"];
  };
}
