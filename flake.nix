{
  description = "A NixOS module for star citizen";

  inputs = {};

  outputs = _: {nixosModules.default = import ./nix;};
}
