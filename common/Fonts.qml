pragma Singleton

import QtQuick
import Quickshell

QtObject {
    property var medium: FontLoader {
        source: Theme.asset("fonts/medium.otf")
    }
}
