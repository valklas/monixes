{ config, lib, ... }:

let
cfg = config.monixes.system.host;
in {
    options.monixes.system.host = {
        enable = lib.mkEnableOption "Monixes hostname management";

        name = lib.mkOption {
            type = lib.types.str;
            default = "monixes";
            description = "The target hostname for this machine configuration.";
        };
    };

    config = lib.mkIf cfg.enable {
        networking.hostName = cfg.name;
    };
}
