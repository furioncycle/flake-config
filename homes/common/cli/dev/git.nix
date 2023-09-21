{pkgs, config, ...}: 
let
   identity = import ../../../../identities/ttecho.nix;
in {
  programs.git = {
    enable = true;
    userName = identity.fullName;
    userEmail = identity.email;

    package = pkgs.gitFull;

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "${config.programs.git.package}/bin/git-credential-libsecret";
    };
  };
}
