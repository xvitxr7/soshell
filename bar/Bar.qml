import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    color: "transparent"

    implicitHeight: 35

    RowLayout {
        id: rootLayout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        Workspaces {}
        MainIsland {}
    }
}
