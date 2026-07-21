{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.hardware.graphics;
in {
    options.monixes.system.hardware.graphics = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable hardware graphics acceleration (OpenGL / Vulkan drivers).";
        };
    };

    config = lib.mkIf cfg.enable {
        hardware.graphics.enable = true;
    };
}
