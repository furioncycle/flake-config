{pkgs ? (import ./nixpkgs.nix) {}}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimentatl-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [nix home-manager git];
  };
}