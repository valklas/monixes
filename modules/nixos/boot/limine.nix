{ config, lib, ... }:

let
    cfg = config.monixes.system.boot;
in {
    options.monixes.system.boot.limine.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the Limine bootloader.";
    };

    options.monixes.system.boot.canTouchEfiVariables = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Allow modification of EFI variables.";
    };

    config = lib.mkIf cfg.limine.enable {
        boot.loader.limine = {
            enable = cfg.limine.enable;
            style.interface.branding = lib.mkDefault "Monixes Bootloader";
        };
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
