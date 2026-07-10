{ config, lib, pkgs, ... }:

{
    imports = [
        ./hostname.nix
        ./user.nix
    ];
}
