{ stdenv, fetchurl, pkgconfig, intltool, gtk3, libwnck3, libfakekey, libXtst, mate, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "mate-netbook-${version}";
  version = "1.18.2";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${mate.getRelease version}/${name}.tar.xz";
    sha256 = "0xy5mhkg0xfgyr7gnnjrfzqhmdnhyqscrl2h496p06cflknm17vb";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    libwnck3
    libfakekey
    libXtst
    mate.mate-panel
  ];

  meta = with stdenv.lib; {
    description = "MATE utilities for netbooks";
    longDescription = ''
      MATE utilities for netbooks are an applet and a daemon to maximize
      windows and move their titles on the panel.

      Installing these utilities is recommended for netbooks and similar
      devices with low resolution displays.
    '';
    homepage = http://mate-desktop.org;
    license = with licenses; [ gpl3 lgpl2Plus ];
    platforms = platforms.unix;
    maintainers = [ maintainers.romildo ];
  };
}
