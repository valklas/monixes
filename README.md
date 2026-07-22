# MONIXES

A lightweight, unified configuration wrapper for NixOS and Home Manager. See the [wiki](https://github.com/valklas/wiki-monixes.git) for more info.

## Project Architecture

```
monixes/
├── flake.nix
├── LICENSE
├── modules
│   ├── home-manager
│   │   └── default.nix
│   └── nixos
│       ├── boot.nix
│       ├── default.nix
│       ├── desktop
│       │   ├── DE
│       │   │   ├── default.nix
│       │   │   └── plasma.nix
│       │   ├── default.nix
│       │   └── display-manager.nix
│       ├── hardware
│       │   ├── audio.nix
│       │   ├── bluetooth.nix
│       │   ├── default.nix
│       │   └── graphics.nix
│       ├── hostname.nix
│       ├── networking
│       │   ├── default.nix
│       │   ├── firewall.nix
│       │   └── networkmanager.nix
│       ├── nix.nix
│       └── user.nix
└── README.md

8 directories, 20 files
```

## License

This Repo is under [MIT](LICENSE).
