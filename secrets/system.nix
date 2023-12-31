{inputs, ...}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  config.age = {
    secrets = {
      users-ttecho.file = ./users/ttecho.age;
    };

    identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      # "/etc/ssh/ssh_host_rsa_key"
    ];
  };
}
