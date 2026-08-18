{ config, lib, ... }:

let
    cfg = config.monixes.system.boot;
in {
    options.monixes.system.boot.kernelParams = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "Additional kernel parameters to pass at boot.";
        example = [ "kvm-intel" "tun" ];
    };

    config.boot.kernelParams = lib.mkAfter (lib.unique (
        [ "quiet" ]
        ++ lib.optional cfg.plymouth.enable "splash"
        ++ cfg.kernelParams
    ));
}
