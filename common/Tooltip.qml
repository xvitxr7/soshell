import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root
    visible: false

    color: "transparent"


    anchors {
        top: true
        left: true
    }

    margins {
        left: x - rootItem.width / 2
        top: y
    }

    property real x
    property real y
    property color bgColor

    function show() {
        visible = true
    }

    function hide() {
        visible = false
    }

    Item {
        id: rootItem
        anchors.fill: parent

        height: rootLayout.height

        ColumnLayout {
            id: rootLayout
            anchors.fill: parent
            spacing: -3

            Behavior on opacity {
                NumberAnimation { duration: 800 }
            }

            Behavior on y {
                NumberAnimation { duration: 150 }
            }

            Shape {
                id: triangle
                anchors.horizontalCenter: parent.horizontalCenter

                ShapePath {
                    strokeColor: "transparent"
                    fillColor: root.bgColor
                    capStyle: ShapePath.RoundCap
                    startX: 10; startY: 0
                    PathLine { x: 20; y: 10 }
                    PathLine { x: 0; y: 10 }
                }
            }

            Rectangle {
                implicitWidth: root.width
                implicitHeight: root.height - triangle.height

                color: root.bgColor

                radius: 10
            }
        }
    }
}
