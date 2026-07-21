{ config, lib, pkgs, ... }:

{
    imports = [
        ./desktop
        ./hardware
        ./networking
        ./boot.nix
        ./hostname.nix
        ./nix.nix
        ./user.nix
    ];
}
