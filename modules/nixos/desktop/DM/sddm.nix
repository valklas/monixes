{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.DM.sddm;
in {
    options.monixes.system.desktop.DM.sddm = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable SDDM display manager.";
        };
    };

    config = lib.mkIf cfg.enable {
        services.displayManager.sddm = {
            enable = lib.mkDefault true;
            wayland.enable = lib.mkDefault true;
        };
    };
}
