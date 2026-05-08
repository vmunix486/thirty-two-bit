with import <nixpkgs> { };

let
  oldPkgs =
    import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/aeaa79dc82980869a88a5955ea3cd3e1944b7d80.tar.gz") { };

  # gcc49Stdenv was retired from nixpkgs (kernel 3.7 only builds with gcc <= 4.9),
  # so pull it from the last release branch that still ships it: nixos-24.05.
  gcc49Pkgs =
    import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b134951a4c9f3c995fd7be05f3243f8ecd65d798.tar.gz") { };

  oldPerlPkg = oldPkgs.perl520;

in
gcc49Pkgs.gcc49Stdenv.mkDerivation
{
  name = "old-kernel-dev-environment";
  buildInputs = [
    ncurses
    ncurses.dev
    pkg-config
    syslinux
    oldPerlPkg
    flex
    bison
    rsync
    less
    nettools
  ];

  shellHook = ''
    export GR_CPUS=$(nproc --all)
    cd ../linux-3.7.10/
  '';
}
