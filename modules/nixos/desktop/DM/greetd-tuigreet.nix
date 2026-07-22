{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.DM.greetd-tuigreet;
# Map friendly names to actual commands
cmd = if cfg.environment == "plasma-wayland" then
        "startplasma-wayland"
      else if cfg.environment == "plasma-x11" then
        "startplasma-x11"
      else
        cfg.environment;
in {
    options.monixes.system.desktop.DM.greetd-tuigreet = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable greetd display manager with tuigreet.";
        };

        environment = lib.mkOption {
            type = lib.types.str;
            default = "bash";
            description = "The target user environment name or custom startup command (e.g. start-hyprland,).";
        };
    };

    config = lib.mkIf cfg.enable {
        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${cmd}";
                    user = "greeter";
                };
            };
        };
    };
}
