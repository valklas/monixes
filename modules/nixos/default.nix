{ config, lib, pkgs, ... }:

{
    imports = [
        ./networking
        ./hostname.nix
        ./nix.nix
        ./user.nix
    ];
}
