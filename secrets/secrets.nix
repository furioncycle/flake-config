let 
  identity = import ../identities/ttecho.nix;

in {
  "users/ttecho.age".publicKeys = identity.userKeys;
  "github/email.age".publicKeys = identity.githubKeys;
}
