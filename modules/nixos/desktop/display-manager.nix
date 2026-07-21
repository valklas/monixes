{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.displayManager.greetd;
in {
    options.monixes.system.desktop.displayManager.greetd = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable greetd display manager with tuigreet.";
        };

        environment = lib.mkOption {
            type = lib.types.str;
            default = "bash";
            description = "The target user environment name or custom startup command (e.g. start-hyprland).";
        };
    };

    config = lib.mkIf cfg.enable {
        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${cfg.environment}";
                    user = "greeter";
                };
            };
        };
    };
}
