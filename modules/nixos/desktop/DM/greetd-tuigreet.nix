{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.DM;
in {
    config = lib.mkIf (cfg.displayManager == "greetd-tuigreet") {
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
