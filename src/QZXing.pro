include(QZXing.pri)

VERSION = 2.3

TARGET = QZXing
TEMPLATE = lib

# CONFIG += staticlib

DEFINES -= DISABLE_LIBRARY_FEATURES


symbian {
    TARGET.UID3 = 0xE618743C
    TARGET.EPOCALLOWDLLDATA = 1

    #TARGET.CAPABILITY = All -TCB -AllFiles -DRM
    TARGET.CAPABILITY += NetworkServices \
        ReadUserData \
        WriteUserData \
        LocalServices \
        UserEnvironment \
        Location
}

!symbian {
    isEmpty(PREFIX) {
        maemo5 {
            target.path = /opt/usr/lib
        } else {
            target.path = /usr/lib
        }
    }

    DEFINES += NOFMAXL

	# Installation
	headers.files = qzxing.h QZXing_global.h
	headers.path = $$PREFIX/include
	target.path = $$PREFIX/lib
	INSTALLS += headers target

	# pkg-config support
	CONFIG += create_pc create_prl no_install_prl
	QMAKE_PKGCONFIG_DESTDIR = pkgconfig
	QMAKE_PKGCONFIG_LIBDIR = ${prefix}/lib
	QMAKE_PKGCONFIG_INCDIR = ${prefix}/include

	unix:QMAKE_CLEAN += -r pkgconfig lib$${TARGET}.prl
}
symbian {
    TARGET.UID3 = 0xE618743C
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = QZXing.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
#    TARGET.CAPABILITY = All -TCB -AllFiles -DRM
    TARGET.CAPABILITY += NetworkServices \
        ReadUserData \
        WriteUserData \
        LocalServices \
        UserEnvironment \
        Location
}

OTHER_FILES += \
    qtc_packaging/debian_fremantle/rules \
    qtc_packaging/debian_fremantle/README \
    qtc_packaging/debian_fremantle/copyright \
    qtc_packaging/debian_fremantle/control \
    qtc_packaging/debian_fremantle/compat \
    qtc_packaging/debian_fremantle/changelog \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    qtc_packaging/debian_fremantle/rules \
    qtc_packaging/debian_fremantle/README \
    qtc_packaging/debian_fremantle/copyright \
    qtc_packaging/debian_fremantle/control \
    qtc_packaging/debian_fremantle/compat \
    qtc_packaging/debian_fremantle/changelog


