import QtQuick
import QtQuick.Window
import Quickshell
import Qt5Compat.GraphicalEffects

import qs.common

Item {
    id: root

    width: Theme.s(43)
    height: Theme.s(43)

    Image {
        width: parent.width
        height: parent.height

        source: Quickshell.env("HOME") + "/.face"
        sourceSize.width: width

        fillMode: Image.PreserveAspectCrop

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width:  root.width
                height: root.height
                radius: Theme.s(5)
            }
        }
    }

    Rectangle {
        id: borders
        anchors.fill: parent

        radius: Theme.s(5)

        border.color: "#9ba9cf"
        border.width: Theme.s(3)

        color: "transparent"
    }
}
