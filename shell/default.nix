{
  config,
  lib,
  ...
}:
{
  options.shell = lib.mkOption {
    type = lib.types.enum [ "nushell" ];
    default = "nushell";
    description = "Choose shell you willing to use (possible values: nushell)";
  };

  imports = [ ./nushell ];
}
