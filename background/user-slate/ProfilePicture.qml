import QtQuick
import QtQuick.Window
import Quickshell
import Qt5Compat.GraphicalEffects

// TODO: this code sucks refactor it sometime

Item {
    id: root

    width: 40
    height: 40

    Rectangle {
        id: borderMask
        anchors.fill: parent

        radius: 5

        color: "transparent"

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width:  borderMask.width
                height: borderMask.height
                radius: borderMask.radius
            }
        }

        Image {
            width: parent.width
            height: parent.height

            source: Quickshell.env("HOME") + "/.face"
            sourceSize.width: width * Screen.devicePixelRatio

            cache: false
            antialiasing: true
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
        }
    }

    Rectangle {
        id: borders
        anchors.fill: parent

        radius: 5

        border.color: "#9ba9cf"
        border.width: 2

        color: "transparent"
    }
}
