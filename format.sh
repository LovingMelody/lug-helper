#!/usr/bin/env bash
nix-shell \
    -p \
        nixpkgs-fmt \
        nixfmt \
        alejandra \
    --run  \
    'find . -type f -name '*.nix' -exec nixfmt {} \; \
    && find . -type f -name '*.nix' -exec nixpkgs-fmt {} \; \
    && alejandra .'
