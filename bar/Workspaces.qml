import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../common"

Rectangle {
    id: root

    implicitWidth: rootLayout.width + Theme.s(30)
    implicitHeight: Theme.s(30)
    radius: 5

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent
        spacing: Theme.s(8)


        Repeater {
            model: 10

            delegate: Rectangle {
                id: bounds

                property int wsId: index + 1
                property var wsData: Hyprland.workspaces.values.find(i => i.id == wsId)
                property bool isActive: mouse.containsMouse || (Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === wsId)
                property bool isOccupied: wsData !== undefined

                implicitWidth:  Theme.s(isActive ? 15 : 12)
                implicitHeight: Theme.s(isActive ? 15 : 12)

                Behavior on implicitWidth {
                    NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
                }

                color: !isOccupied ? "transparent" : "#263754"
                Behavior on color {
                    ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
                }

                Image {
                    visible: !bounds.isOccupied
                    anchors.fill: parent
                    anchors.centerIn: parent

                    source: Paths.assets("bar/workspace_unoccupied.svg")
                }

                Text {
                    id: workspaceId
                    opacity: bounds.isActive ? 1 : 0
                    Behavior on opacity {
                        NumberAnimation { duration: 100 }
                    }

                    x: 1
                    anchors.verticalCenter: parent.verticalCenter

                    text: bounds.wsId
                    font.family: "Medium"
                    font.pointSize: Theme.s(10)
                    color: "white"

                    transform: Scale {
                        xScale: Theme.s(13) / workspaceId.width
                    }
                }

                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + parent.wsId + "})")
                }
            }
        }
    }
}
