{ config, lib, ... }:

let
cfg = config.monixes.system.desktop.DM;
in {
    config = lib.mkIf (cfg.displayManager == "sddm") {
        services.displayManager.sddm = {
            enable = lib.mkDefault true;
            wayland.enable = lib.mkDefault true;
        };
    };
}
