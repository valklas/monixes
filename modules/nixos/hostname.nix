{ config, lib, ... }:

let
cfg = config.monixes.host;
in {
    options.monixes.host = {
        enable = lib.mkEnableOption "monixes hostname management";

        name = lib.mkOption {
            type = lib.types.str;
            default = "nixos-machine";
            description = "The target hostname for this machine configuration.";
        };
    };

    config = lib.mkIf cfg.enable {
        networking.hostName = cfg.name;
    };
}
