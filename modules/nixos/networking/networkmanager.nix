{ config, lib, ... }:

let
cfg = config.monixes.system.networking.networkmanager;
in {
    options.monixes.system.networking.networkmanager = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true; # It will be active out-of-the-box
            description = "Whether to enable NetworkManager via monixes.";
        };
    };

    config = lib.mkIf cfg.enable {
        networking.networkmanager.enable = true;
    };
}
