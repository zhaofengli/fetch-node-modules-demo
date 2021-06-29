{ pkgs }:
pkgs.stdenvNoCC.mkDerivation {
  name = "bgpalerter-node-packages";

  src = pkgs.fetchFromGitHub {
    owner = "nttgin";
    repo = "BGPalerter";
    rev = "v1.28.1";
    sha256 = "sha256-Y0atkJfZxjUOGPQ3goXS/YD5SsX9ZjpbM0Nc5IuaFP4=";
  };

  builder = ./fetch-node-modules.sh;
  nativeBuildInputs = with pkgs; [
    nodePackages.npm
  ];

  outputHashMode = "flat";
  outputHashAlgo = "sha256";
  outputHash = "sha256-nreh6mMGgCD57jECMY4FnbfKyTgSEYF+Dser/iWwP4Q=";
}
