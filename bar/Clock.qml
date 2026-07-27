import QtQuick
import QtQuick.Layouts
import Quickshell

import "../common"

Item {
    id: root

    implicitWidth: clockRoot.width

    height: Theme.s(30)


    Rectangle {
        id: clockRoot

        width: Math.max(Theme.s(100), clockText.width + Theme.s(30))
        Behavior on width {
            NumberAnimation { duration: 250; easing: Easing.InOutCubic }
        }

        height: root.height
        radius: 5

        color: "#263754"

        Text {
            id: clockText
            anchors.centerIn: parent

            SystemClock {
                id: clock
            }

            text: mouse.containsMouse ? Qt.formatDateTime(clock.date, "dddd dd MMMM") : Qt.formatDateTime(clock.date, "hh•mm")

            SequentialAnimation {
                id: hoverAnimation
                NumberAnimation { target: clockText; property: "opacity"; to: 0; duration: 0 }
                NumberAnimation { target: clockText; property: "opacity"; to: 1; duration: 600 }
            }

            font.family: "Medium"
            font.pointSize: Theme.s(15)
            color: "white"
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true

            onEntered: hoverAnimation.start()
            onExited: hoverAnimation.start()
        }
    }
}
