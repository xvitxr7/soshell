import QtQuick
import QtQuick.Layouts
import Quickshell

import "../common"

Item {
    id: root

    width: Theme.s(120)
    height: Theme.s(30)

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent

        Rectangle {
            id: clockRoot

            implicitWidth: root.width
            implicitHeight: root.height
            radius: Theme.s(8)

            color: "#263754"

            Text {
                anchors.centerIn: parent

                SystemClock {
                    id: clock
                }

                text: Qt.formatDateTime(clock.date, "hh•mm")
                font.family: "Medium"
                font.pointSize: Theme.s(20)
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
                implicitWidth: Theme.s(300)
                implicitHeight: Theme.s(40)
                bgColor: "#263754"
                Text {
                    x: parent.width / 2 - width / 2
                    y: 15
                    text: Qt.formatDateTime(clock.date, "dddd. MMMM dd yyyy")
                    color: "white"
                    font.family: "Medium"
                    font.pointSize: Theme.s(10)
                }
            }
        }
    }
}
