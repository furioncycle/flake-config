{ pkgs,...}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  boot.initrd.kernelModules = [ "intelgpu" ];
  services.xserver.videoDrivers = [ "intelgpu" ];

}
