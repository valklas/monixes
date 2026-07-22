{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.boot;
in {
    config = lib.mkIf (cfg.loader == "limine") {
        boot.loader.limine.enable = true;
        boot.loader.efi.canTouchEfiVariables = cfg.canTouchEfiVariables;
    };
}
