pragma Singleton

import QtQuick
import Quickshell.Io
import Quickshell.Services.UPower

Item {
    property bool animateBackground: true

    property string version: "0.1.0"
    property string release: "alpha"
    property string shellVersion: "0.1.0"

    readonly property bool hasBattery: UPower.devices.values.length > 0

    property real barHeight: Theme.s(40)
}
