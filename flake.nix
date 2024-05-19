# flake.nix

{
  description = "Test of a flake";

  # Para ir buscar as versões específicas vamos ao seguinte website:
  # https://www.nixhub.io/
  # Aqui conseguimos ir buscar versões específicas.
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
                via
                qmk
                avrdude
            ];
          };
    };
}

