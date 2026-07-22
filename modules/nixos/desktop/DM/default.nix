{ config, lib, pkgs, ... }:

{
    imports = [
        ./greetd-tuigreet.nix
        ./sddm.nix
    ];
}
