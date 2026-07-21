{ config, lib, pkgs, ... }:

let
cfg = config.monixes.system.hardware.audio;
in {
    options.monixes.system.hardware.audio = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable modern PipeWire audio stack with ALSA and PulseAudio emulation.";
        };

        supportJack = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable JACK audio emulation layer for pro-audio and production software.";
        };
    };

    config = lib.mkIf cfg.enable {
        # Disable legacy PulseAudio driver to prevent conflicts
        hardware.pulseaudio.enable = false;

        # Enable RealtimeKit for high-priority audio processing
        security.rtkit.enable = true;

        # PipeWire core setup
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true; # Critical for 32-bit games/Steam
            pulse.enable = true;
            jack.enable = cfg.supportJack;
        };
    };
}
