{ config, lib, ... }:

{
    options.monixes.system.boot.plymouth.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the Plymouth graphical boot splash screen.";
    };

    config.boot.plymouth.enable = config.monixes.system.boot.plymouth.enable;
}
