{
fonts.fontconfig = {
  enable = true;
  defaultFonts = {
    monospace = [
      "Tamzen"
      "0xProto"
      "Commit Mono"
    ];
    # TODO(https://github.com/NixOS/nixpkgs/issues/312826): Migrate into Fluent Emoji
    emoji = ["JoyPixels"];
  };
};
}
