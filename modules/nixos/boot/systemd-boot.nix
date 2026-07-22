{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.boot;
in {
    config = lib.mkIf (cfg.loader == "systemd-boot") {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
