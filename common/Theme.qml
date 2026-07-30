pragma Singleton

import QtQuick
import Quickshell

QtObject {
    readonly property real designScale: 1080
    readonly property real currentScale: Screen.height / designScale

    // scale values with the monitor height, to maintain vertical pixel accuracy
    function s(value: real): real {
        return Math.round(value * currentScale)
    }
}
