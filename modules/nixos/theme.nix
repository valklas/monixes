{ config, lib, ... }:

let
    cfg = config.monixes.system.theme;
in {
    options.monixes.system.theme = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable the Monixes system theme.";
        };

        flavor = lib.mkOption {
            type = lib.types.enum [ "latte" "frappe" "macchiato" "mocha" ];
            default = "mocha";
            description = "The Catppuccin flavor used by the system theme.";
        };

        accent = lib.mkOption {
            type = lib.types.enum [
                "rosewater"
                "flamingo"
                "pink"
                "mauve"
                "red"
                "maroon"
                "peach"
                "yellow"
                "green"
                "teal"
                "sky"
                "sapphire"
                "blue"
                "lavender"
            ];
            default = "blue";
            description = "The Catppuccin accent color used by the system theme.";
        };
    };

    config = lib.mkIf cfg.enable {
        catppuccin = {
            enable = true;
            autoEnable = true;
            flavor = cfg.flavor;
            accent = cfg.accent;
        };
    };
}
