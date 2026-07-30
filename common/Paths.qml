pragma Singleton

import QtQuick
import Quickshell

QtObject {
    function assets(path: string): string {
        return Quickshell.shellPath("assets/" + path)
    }
}
