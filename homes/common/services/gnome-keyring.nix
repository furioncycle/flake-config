{ pkgs, ...}: {
  services.gnome-keyring = {
    enable = true;
  };

  home = {
    persistence."/nix/persist/home/ttecho".directories = [".local/share/keyrings"];
    packages = with pkgs; [gcr];
  };
}
