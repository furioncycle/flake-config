{
  programs.ssh = {
    enable = true;
  };

  home.persistence."/nix/persist/home/ttecho".directories = [".ssh"];
}
