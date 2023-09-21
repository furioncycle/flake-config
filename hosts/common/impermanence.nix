{inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  system.activationScripts.createPresist = "mkdir -p /nix/persist";

  environment.persistence."/nix/persist" = {
    hideMounts = true;

    directories = [
      "/etc/nixos"
      "/etc/NetworkManager"
      "/var/log"
    ];
  };
}
