{ lib, ... }:

{
    imports = [
        ./limine.nix
    ];

    options.monixes.system.boot = {
        loader = lib.mkOption {
            type = lib.types.enum [ "limine" ];
            default = "limine";
            description = "The bootloader to enable/configure.";
        };

        canTouchEfiVariables = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Allow modification of EFI variables.";
        };
    };
}
