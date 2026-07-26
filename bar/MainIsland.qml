import QtQuick
import QtQuick.Layouts
import Quickshell

import "../common"

Item {
    id: root

    width: 100
    height: 25

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent

        Rectangle {
            id: clockRoot

            implicitWidth: 100
            implicitHeight: root.height
            radius: 5

            color: "#263754"

            Text {
                anchors.centerIn: parent
                SystemClock {
                    id: clock
                }

                text: Qt.formatDateTime(clock.date, "hh•mm")
                font.family: "Medium"
                font.pointSize: 15
                color: "white"
            }


            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
                onEntered: tooltip.show()
                onExited: tooltip.hide()
            }

            Tooltip {
                id: tooltip
                x: 1060
                implicitWidth: 300
                implicitHeight: 40
                bgColor: "#263754"
                Text {
                    x: parent.width / 2 - width / 2
                    y: 18
                    text: Qt.formatDateTime(clock.date, "dddd. MMMM dd yyyy")
                    color: "white"
                    font.family: "Medium"
                }
            }
        }
    }
}
