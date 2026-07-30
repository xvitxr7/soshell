pragma Singleton

import QtQuick
import Quickshell

import qs.common

QtObject {
    property var medium: FontLoader {
        source: Paths.assets("fonts/medium.otf")
    }

    property var inter: FontLoader {
        source: Paths.assets("fonts/inter.ttf")
    }

    property var martian: FontLoader {
        source: Paths.assets("fonts/martian_mono_nfp.ttf")
    }
}
