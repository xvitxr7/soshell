import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true

    margins.left: 1440
    margins.top: 70

    width: 370
    height: rootLayout.height

    aboveWindows: false 
    color: "transparent"

    SystemClock {
        id: sysClock
    }

    ColumnLayout {
        id: rootLayout
        spacing: -4

        Text {
            id: time
            text: Qt.formatDateTime(sysClock.date, "hh•mm•ss")
            font.pointSize: 40
            font.family: "Medium"

            color: "white"

            transform: Scale {
                xScale: root.width / time.width
            }
        }

        Text {
            id: date
            text: Qt.formatDateTime(sysClock.date, "dddd dd MMMM")
            font.pointSize: 13
            font.family: "Medium"

            color: "white"

            transform: Scale {
                xScale: root.width / date.width
            }
        }
    }
}
