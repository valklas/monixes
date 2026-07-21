{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware
        ./networking
        ./boot.nix
        ./hostname.nix
        ./nix.nix
        ./user.nix
    ];
}
