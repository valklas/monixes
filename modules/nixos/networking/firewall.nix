{ config, lib, ... }:

let
  cfg = config.monixes.system.networking.firewall;
in {
  options.monixes.system.networking.firewall = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the managed monixes system firewall wrapper.";
    };

    allowSSH = lib.mkOption {
      type = lib.types.bool;
      default = false; # Secure by default; turn on manually if needed
      description = "Open default ports for incoming SSH connections (Port 22 and 443).";
    };

    allowedTCPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.port;
      default = [ ];
      description = "Additional specific TCP ports to open globally.";
    };

    allowedUDPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.port;
      default = [ ];
      description = "Additional specific UDP ports to open globally.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall = {
      enable = true;
      
      # Conditionally add port 22 and 443 if SSH toggle is active
      allowedTCPPorts = cfg.allowedTCPPorts ++ (if cfg.allowSSH then [ 22 443 ] else [ ]);
      allowedUDPPorts = cfg.allowedUDPPorts;
    };
  };
}
