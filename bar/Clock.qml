import QtQuick
import QtQuick.Layouts
import Quickshell

import "../common"

Item {
    id: root

    width: rootLayout.width
    height: Theme.s(30)

    RowLayout {
        id: rootLayout

        Rectangle {
            id: clockRoot

            implicitWidth: Theme.s(100)
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
                font.pointSize: Theme.s(15)
                color: "white"
            }

        }
    }
}
