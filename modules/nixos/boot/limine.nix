{ config, lib, ... }:

let
    cfg = config.monixes.system.boot;
in {
    options.monixes.system.boot.canTouchEfiVariables = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Allow modification of EFI variables.";
    };

    config = {
        boot.loader.limine = {
            enable = true;
            style.interface.branding = lib.mkDefault "Monixes Bootloader";
        };
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
