{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.desktop.DM;
in {
    config = lib.mkIf (cfg.displayManager == "greetd-tuigreet") (
        let
            cmd = if cfg.environment == "plasma-wayland" then
                    "startplasma-wayland"
                  else if cfg.environment == "plasma-x11" then
                    "startplasma-x11"
                  else
                    cfg.environment;
        in {
            services.greetd = {
                enable = true;
                settings = {
                    default_session = {
                        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${cmd}";
                        user = "greeter";
                    };
                };
            };
        }
    );
}
