{ stdenv, fetchurl, pkgconfig, intltool, itstool, libxml2, libcanberra_gtk3, libgtop, gnome2, gnome3, mate, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "marco-${version}";
  version = "1.18.2";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${mate.getRelease version}/${name}.tar.xz";
    sha256 = "173g9mrnkcgjc6a1maln13iqdl0cqcnca8ydr8767xrn9dlkx9f5";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    itstool
    wrapGAppsHook
  ];

  buildInputs = [
    libxml2
    libcanberra_gtk3
    libgtop
    gnome2.startup_notification
    gnome3.gtk
    gnome3.zenity
  ];
  
  meta = with stdenv.lib; {
    description = "MATE default window manager";
    homepage = https://github.com/mate-desktop/marco;
    license = [ licenses.gpl2 ];
    platforms = platforms.unix;
    maintainers = [ maintainers.romildo ];
  };
}
