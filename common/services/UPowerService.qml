pragma Singleton

import Quickshell.Services.UPower
import QtQuick

QtObject {
    readonly property bool hasBattery: UPower.devices.values.length > 0
}
