{
  config,
  dream2nix,
  ...
}: {
  name = "hello";
  version = "0.0.1";

  imports = [
    dream2nix.modules.dream2nix.mkDerivation
  ];

  deps = {nixpkgs, ...}: {
    inherit (nixpkgs) clang-tools cmake cmake-language-server cppcheck ninja stdenv;
  };

  mkDerivation = {
    src = ./.;
    nativeBuildInputs = with config.deps; [clang-tools cmake cmake-language-server cppcheck ninja];
  };
}