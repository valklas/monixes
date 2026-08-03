{ config, lib, ... }:

{
    imports = [
        ./limine.nix
        ./systemd-boot.nix
        ./grub.nix
    ];

    options.monixes.system.boot = {
        loader = lib.mkOption {
            type = lib.types.enum [ "limine" "systemd-boot" "grub" ];
            default = "limine";
            description = "The bootloader to enable/configure.";
        };

        canTouchEfiVariables = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Allow modification of EFI variables.";
        };

        grub = {
            device = lib.mkOption {
                type = lib.types.str;
                default = "nodev";
                description = "The device on which to install GRUB. Set to 'nodev' for EFI.";
            };

            efiSupport = lib.mkOption {
                type = lib.types.bool;
                default = true;
                description = "Whether to enable EFI support in GRUB.";
            };

            useOSProber = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = "Whether to use OS prober to detect other operating systems.";
            };
        };
    };
}
