{ inputs, outputs, config, ...}: {
  imports = [
    ../../common
    ../../common/modules/audio.nix
    ../../common/modules/intel.nix
    ../../common/modules/client.nix
    ../../common/modules/xdg.nix
    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.ttecho = import ./home-manager.nix;
  };

  networking.hostName = "deaf";
}
