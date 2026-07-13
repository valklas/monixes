{ config, lib, pkgs, ... }:

{
    imports = [
        ./firewall.nix
        ./networkmanager.nix
    ];
}
