{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.lug.star-citizen;
in {
  options.lug.star-citizen = {
    enable = mkEnableOption "Enable Star citizen requirements";
    anticheatWorkAround = mkEnableOption "Enable anti-cheat work around";
  };

  config = mkIf cfg.enable {
    boot.kernel.sysctl = {
      "vm.max_map_count" = mkDefault 16777216;
      "fs.file-max" = mkDefault 524288;
    };

    programs.gamemode.enable = mkDefault cfg.programs.gamemode;

    hardware = {
      opengl = {
        enable = mkDefault true;
        driSupport32Bit = mkDefault true;
      };
    };

    networking = mkIf cfg.anticheatWorkAround {
      hostFiles = [./hosts];
    };
    # Deps based on lug-helper
    environment.systemPackages = with pkgs; [
      gamescope
      mangohud
      lutris
    ];
  };
}
