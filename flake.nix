{
    description = "Monixes: Simple system and user configuration wrapper modules";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        catppuccin.url = "github:catppuccin/nix";
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        # System-level modules bundled together
        nixosModules.default = { config, lib, pkgs, ... }: {
            imports = [
                inputs.catppuccin.nixosModules.catppuccin
                ./modules/nixos
            ];
        };

        # Home Manager-level modules bundled together
        homeManagerModules.default = { config, lib, pkgs, ... }: {
            imports = [
                inputs.catppuccin.homeModules.catppuccin
                ./modules/home-manager
            ];
        };
    };
}
