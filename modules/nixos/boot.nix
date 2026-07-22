{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.boot;
in {
    options.monixes.system.boot.limine = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Limine bootloader configuration.";
        };
    };

    config = lib.mkIf cfg.enable {
        boot.loader.limine.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
    };
}
