import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common.services

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    color: "transparent"

    implicitHeight: Config.barHeight

    RowLayout {
        id: rootLayout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: Theme.s(10)

        Workspaces {}
        Clock {}
        Audio {}

        Loader {
            id: batteryIslandLoader
            source: UPowerService.hasBattery ? "Battery.qml" : ""
        }
    }
}
