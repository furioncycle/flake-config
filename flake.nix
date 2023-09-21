{
  description = "Ttecho's NixOS configuration";
 
  inputs = {

    # Nix packages from the unstable channel
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";

    # Age encrypted secrets using SSH keys
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Managing user environments
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

       
    # Helper for persistent state on tmp storage
    impermanence.url = "github:nix-community/impermanence";

    hyprwm-hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Hyprland window manager extras
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = 
    { self
    , nixpkgs
    , home-manager
    ,... 
    } @inputs: let
      inherit (self) outputs;

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];

      mkSystem = modules:
       nixpkgs.lib.nixosSystem {
        system = "x86_64";
        inherit modules;
        specialArgs = {inherit inputs outputs; };
      };
    in {

      packages = forAllSystems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in  
        import ./pkgs {inherit pkgs;});

      devShells = forAllSystems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./shell.nix {inherit pkgs;});

      overlays = import ./overlays {inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
              
      nixosConfigurations = {
        deaf = mkSystem [./hosts/clients/deaf];
        # jedi = mkSystem [./hosts/servers/jedi];    
      };

      # TODO Deploying for JEDI

      # checks = builtins.mapAttrs (system: deplayLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
