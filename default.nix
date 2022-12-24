{ stdenv
, lib
, fetchFromGitHub
, autoreconfHook
, fuse
, libnfs
}:

stdenv.mkDerivation rec {
  pname = "fuse-nfs";
  version = "331e6fe5ea39d2353bbbe85e87b5850e4b144d9f";

  src = fetchFromGitHub {
    owner = "sahlberg";
    repo = "fuse-nfs";
    rev = version;
    hash = "sha256-YPBPH1PMHAiuHV8DtZNJVZ8VP4YeZ357ZTA2XOP/rA8=";
  };

  nativeBuildInputs = [
    autoreconfHook
  ];

  buildInputs = [
    libnfs
    fuse
  ];

  postInstall = ''
    # useless pkgconfig files - it's a binary
    rm -rf $out/lib
  '';

  outputs = [ "out" "man" ];
}
