{
  services.openssh = {
    enable = true;

    settings = {
      
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  environment.persistence."/nix/persist" = {
    files = [
      "/etc/ssh/ssh-host_ed25519_key"
      "/etc/ssh/ssh-host_ed25519_key.pub"
    ];
  };
}
