rec {
  firstName = "Angel";
  lastName = "Marquez";
  fullName = "${firstName} ${lastName}";

  email = "ttecho2021@gmail.com";

  hosts = {
    deaf = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKja0sjSjn+Tnu/lZWoLw5YGN02zgPXiCpxNvOxijhDC ttecho";
      sshGithubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChIarFFxFYGUct3GP84fo/6RAI4NW+lb4TcmM+ztreJ admarquez21@gmail.com"; 
    };
  };

  userKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshUserKey) hosts);
  githubKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshGithubKey) hosts);
  # allKeys = builtins.concatLists [userKeys githubKeys ];
}
 

