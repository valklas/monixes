{ config, lib, ... }:

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

        kernelParams = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
            description = "Additional kernel parameters to pass at boot.";
            example = [ "quiet" "splash" ];
        };
    };

    config.boot.kernelParams = lib.mkAfter config.monixes.system.boot.kernelParams;
}
