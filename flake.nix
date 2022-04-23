{
  description = "A very basic flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/master";
    };
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.nodejs = (nixpkgs.legacyPackages.x86_64-linux.nodejs_latest.overrideAttrs (old: rec {
        src = builtins.fetchurl {
          url = "https://nodejs.org/dist/v${version}/node-v${version}.tar.xz";
          sha256 = "0xffp1c8a2zbdf99jdn0fbym8wnsikkw7xczjydcc95m81jhwk9l";
        };
        version = "18.0.0";
        patches = [];
    }));

    packages.x86_64-linux.nodejs_18 = self.packages.x86_64-linux.nodejs;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.nodejs;

  };
}
