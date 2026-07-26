pragma Singleton

import QtQuick
import Quickshell

QtObject {
    property var medium: FontLoader {
        source: Theme.asset("fonts/medium.otf")
    }

    property var inter: FontLoader {
        source: Theme.asset("fonts/inter.ttf")
    }

    property var martian: FontLoader {
        source: Theme.asset("fonts/martian_mono_nfp.ttf")
    }
}
