{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.DE.plasma;
in {
    options.monixes.system.desktop.DE.plasma = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable KDE Plasma 6 desktop environment.";
        };
    };

    config = lib.mkIf cfg.enable {
        # 1. Enable the X11/Wayland display server infrastructure
        services.xserver.enable = true;
        # 2. Enable KDE Plasma 6
        services.desktopManager.plasma6.enable = true;
    };
}
