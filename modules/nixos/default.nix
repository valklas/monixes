{ config, lib, pkgs, ... }:

{
    imports = [
        ./desktop
        ./hardware
        ./networking
        ./boot
        ./hostname.nix
        ./nix.nix
        ./user.nix
    ];
}
