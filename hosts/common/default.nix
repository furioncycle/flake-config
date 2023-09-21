{inputs, outputs, config, lib, ...}:{
  imports = [
    ./boot.nix
    #./gpg.nix
    ./impermanence.nix
    ./networking.nix
    ./openssh.nix
    ./users.nix
    ../../secrets/system.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  #nix and nixpkgs settings
  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
      trusted-users = [ "ttecho" ];
    };
  };

  nixpkgs = {
    overlays = with outputs.overlays; [
      additions
      modifications
      unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };
  
  documentation.man.generateCaches = false;
  programs.fuse.userAllowOther = true;

  services.ntp.enable = true;
  time.timeZone = "America/Los_Angeles";

  # security.polkit.enable = true; #CVE is around do I need it?
  system.stateVersion = "23.05";
}
