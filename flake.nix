{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    dream2nix.url = "github:nix-community/dream2nix";
  };

  outputs = {
    dream2nix,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {inherit system;};
  in {
    packages.${system}.default = dream2nix.lib.evalModules {
      packageSets.nixpkgs = pkgs;
      modules = [
        ./default.nix
        {
          paths.package = ./.;
          paths.projectRoot = ./.;
          paths.projectRootFile = ".git";
        }
      ];
    };
  };
}
