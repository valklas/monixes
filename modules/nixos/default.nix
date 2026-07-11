{ config, lib, pkgs, ... }:

{
    imports = [
        ./networking
        ./hostname.nix
        ./user.nix
    ];
}
