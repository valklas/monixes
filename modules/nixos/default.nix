{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware
        ./networking
        ./hostname.nix
        ./nix.nix
        ./user.nix
    ];
}
