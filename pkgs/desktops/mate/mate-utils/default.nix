{ stdenv, fetchurl, pkgconfig, intltool, itstool, gtk3, libxml2, libgtop, libcanberra_gtk3, mate, hicolor_icon_theme, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "mate-utils-${version}";
  version = "1.18.3";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${mate.getRelease version}/${name}.tar.xz";
    sha256 = "1nw8rcq3x67v73cmy44zz6r2ikz46wsx834qzkbq4i2ac96kdkfz";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    itstool
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    libgtop
    libcanberra_gtk3
    libxml2
    mate.mate-panel
    hicolor_icon_theme
  ];

  meta = with stdenv.lib; {
    description = "Utilities for the MATE desktop";
    homepage = http://mate-desktop.org;
    license = with licenses; [ gpl2Plus lgpl2Plus ];
    platforms = platforms.unix;
    maintainers = [ maintainers.romildo ];
  };
}
