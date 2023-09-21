{pkgs, inputs, ...}: {
  imports = [
    ./editors/neovim
    # ./editors/helix
    ./shells/fish.nix
    ./shells/starship.nix
    ./dev/direnv.nix
    ./dev/git.nix
    # ./dev/gpg.nix
    ./dev/ssh.nix
    ./dev/tools.nix
  ];

  home.packages = with pkgs; [
    ncdu
    htop
    neofetch
    inputs.agenix.packages.${system}.default
  ];
}
