{outputs, ...}: {
  imports = [
    ../common
    ../../secrets/users.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "ttecho";
    homeDirectory = "/home/ttecho";

    persistence."/nix/persist/home/ttecho" = {
      directories = [ "Documents" "Pictures" "Videos" "Music" "Desktop"];
      allowOther = true;
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
