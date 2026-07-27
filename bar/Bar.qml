import QtQuick
import QtQuick.Layouts
import Quickshell
import "../common"

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

        Loader {
            id: batteryIslandLoader
            source: Config.hasBattery ? "Battery.qml" : null
        }
    }
}
