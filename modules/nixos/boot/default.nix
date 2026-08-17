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
            default = [ "quiet" "splash" ];
            description = "Additional kernel parameters to pass at boot.";
            example = [ "quiet" "splash" ];
        };

        plymouth.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable the Plymouth graphical boot splash screen.";
        };
    };

    config = {
        boot.kernelParams = lib.mkAfter config.monixes.system.boot.kernelParams;
        boot.plymouth.enable = config.monixes.system.boot.plymouth.enable;
    };
}
