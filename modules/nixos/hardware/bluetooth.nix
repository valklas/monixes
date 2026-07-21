{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.hardware.bluetooth;
in {
    options.monixes.system.hardware.bluetooth = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable Bluetooth support.";
        };
    };

    config = lib.mkIf cfg.enable {
        hardware.bluetooth.enable = true;
    };
}
