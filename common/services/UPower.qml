pragma Singleton

import Quickshell.UPower
import QtQuick

QtObject {
    readonly property bool hasBattery: UPower.devices.values.length > 0
}
