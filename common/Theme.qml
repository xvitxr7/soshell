pragma Singleton

import QtQuick
import Quickshell

QtObject {
    readonly property real designScale: 1080
    readonly property real currentScale: Screen.height / designScale

    function s(value: real): real {
        return Math.round(value * currentScale)
    }

    function asset(path: string): string {
        return Quickshell.shellPath("assets/" + path)
    }
}
