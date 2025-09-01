#!/bin/sh
set -ex

case "$OS" in
  FreeBSD)
    sed -i '' -e 's/quarterly/latest/' /etc/pkg/FreeBSD.conf
    export ASSUME_ALWAYS_YES=true
    pkg install -y autoconf bash boost-libs catch2 cmake ccache gcc gmake git glslang libfmt libzip liblz4 lzlib mbedtls3 nasm \
                ninja pkgconf qt6-base qt6ct qt6-multimedia qt6-tools qt6-translations qt6-wayland unzip vulkan-tools vulkan-loader wget zip
    ;;
  Solaris)
    pkg install autoconf bash boost-libs catch2 cmake ccache gcc gmake git glslang libfmt libzip liblz4 lzlib mbedtls3 nasm \
                ninja pkgconf qt6-base qt6ct qt6-multimedia qt6-tools qt6-translations qt6-wayland unzip vulkan-tools vulkan-loader wget zip
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac
