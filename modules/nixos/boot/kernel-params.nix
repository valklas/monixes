{ config, lib, ... }:

{
    options.monixes.system.boot.kernelParams = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "quiet" "splash" ];
        description = "Additional kernel parameters to pass at boot.";
        example = [ "quiet" "splash" ];
    };

    config.boot.kernelParams = lib.mkAfter config.monixes.system.boot.kernelParams;
}
