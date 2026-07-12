{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.nix;
in {
    options.monixes.system.nix = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable optimized monixes Nix package manager settings.";
        };

        allowUnfree = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Whether to allow non-free/proprietary packages.";
        };
    };

    config = lib.mkIf cfg.enable {
        # Allow unfree packages based on the option
        nixpkgs.config.allowUnfree = cfg.allowUnfree;

        # Automated background optimization and cleanup
        nix = {
            settings = {
                # Automatically hardlink identical files in the store to save space
                auto-optimise-store = true;
                # Keep the flakes experimental features enabled out-of-the-box
                experimental-features = [ "nix-command" "flakes" ];
            };

            # Weekly automated garbage collection
            gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
            };
        };
    };
}
