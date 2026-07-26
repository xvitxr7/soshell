import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../common"

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true

    margins.left: Theme.s(1440)
    margins.top: Theme.s(70) - Config.barHeight

    width: Theme.s(370)
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
            font.pointSize: Theme.s(40)
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
