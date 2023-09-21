{pkgs, ...}: let
  identity = import ../../identities/ttecho.nix;
in {
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      root.openssh.authorizedKeys.keys = identity.userKeys;
      ttecho = {
        hashedPasswordFile = "/nix/persist/passwd";
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "video" ];
        openssh.authorizedKeys.keys = identity.userKeys;
      };
    };
  };

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;
}
