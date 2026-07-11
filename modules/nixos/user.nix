{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.user;
in {
    options.monixes.system.user = {
        enable = lib.mkEnableOption "Monixes user account management";

        name = lib.mkOption {
            type = lib.types.str;
            description = "The principal user account username.";
        };
    };

    config = lib.mkIf cfg.enable {
        users.users."${cfg.name}" = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
            home = "/home/${cfg.name}";
        };
    };
}
