import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common
import qs.common.services

Item {
    id: root

    x: Theme.s(1440)
    y: Theme.s(70) - Config.barHeight

    width: Theme.s(370)
    height: rootLayout.height

    SystemClock {
        id: sysClock
    }

    ColumnLayout {
        id: rootLayout
        spacing: -4
        width: parent.width

        Text {
            id: time
            text: Qt.formatDateTime(sysClock.date, "hh•mm•ss")
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: Theme.s(40)
            font.family: "Medium"

            color: "white"
        }

        Text {
            id: date
            text: Qt.formatDateTime(sysClock.date, "dddd dd MMMM")
            Layout.alignment: Qt.AlignHCenter
            font.family: FontService.medium.font.family
            font.pointSize: 13
            renderType: Text.CurveRendering

            color: "white"
        }
    }
}
