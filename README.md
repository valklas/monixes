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
│       ├── default.nix
│       ├── hardware
│       │   ├── audio.nix
│       │   └── default.nix
│       ├── hostname.nix
│       ├── networking
│       │   ├── default.nix
│       │   ├── firewall.nix
│       │   └── networkmanager.nix
│       ├── nix.nix
│       └── user.nix
└── README.md

6 directories, 13 files
```

## License

This Repo is under [MIT](LICENSE).
