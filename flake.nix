{
    description = "Monixes: Simple system and user configuration wrapper modules";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        # System-level modules bundled together
        nixosModules.default = { config, lib, pkgs, ... }: {
            imports = [
                ./modules/nixos
            ];
        };

        # Home Manager-level modules bundled together
        homeManagerModules.default = { config, lib, pkgs, ... }: {
            imports = [
                ./modules/home-manager
            ];
        };
    };
}
