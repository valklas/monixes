{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.boot;
in {
    config = lib.mkIf (cfg.loader == "grub") {
        boot.loader.grub = {
            enable = true;
            device = cfg.grub.device;
            useOSProber = cfg.grub.useOSProber;
            efiSupport = cfg.canTouchEfiVariables;
        };
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
