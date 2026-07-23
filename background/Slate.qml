import Quickshell
import QtQuick

Image {
    id: root

    property int slateId: 1

    source: Quickshell.shellPath("assets/slate_" + slateId + ".svg")

    opacity: mouse.containsMouse ? 1 : 0.92
    Behavior on opacity {
        NumberAnimation { duration: 150 }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }
}
