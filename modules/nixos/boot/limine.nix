{ config, lib, ... }:

let
cfg = config.monixes.system.boot;
in {
    config = lib.mkIf (cfg.loader == "limine") {
        boot.loader.limine = {
            enable = true;
            style.interface.branding = "Monixes Bootloader";
        };
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
