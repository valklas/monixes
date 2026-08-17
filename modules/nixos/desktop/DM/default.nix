{ lib, ... }:

{
    imports = [
        ./greetd-tuigreet.nix
    ];

    options.monixes.system.desktop.DM = {
        displayManager = lib.mkOption {
            type = lib.types.enum [ "none" "greetd-tuigreet" ];
            default = "none";
            description = "The display manager to enable.";
        };

        environment = lib.mkOption {
            type = lib.types.str;
            default = "bash";
            description = "The target user environment or custom startup command for greetd-tuigreet (e.g. start-hyprland).";
        };
    };
}
