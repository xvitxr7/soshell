import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
    id: root

    x: 74
    y: 313

    width: rootLayout.width
    height: rootLayout.height

    RowLayout {
        id: rootLayout

        ProfilePicture {}

        Text {
            id: userName
            Layout.topMargin: -8
            
            text: Quickshell.env("USER")

            font.family: "Medium"
            font.pointSize: 30
            color: "#9ba9cf"

            transform: Scale {
                yScale: 40 / userName.height
            }
        }
    }
}
