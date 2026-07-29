import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.common

Item {
    id: root

    x: 32.18
    y: 21.27

    width: rootLayout.width
    height: rootLayout.height

    RowLayout {
        id: rootLayout

        ProfilePicture {
            id: pfp
        }

        Text {
            id: userName
            Layout.alignment: Qt.AlignTop

            text: Quickshell.env("USER")

            font.family: "Medium"
            font.pointSize: Theme.s(36)
            color: "#9ba9cf"

            transform: Scale {
                yScale: pfp.height / userName.height; xScale: (userName.width * 1.4) / userName.width
            }
        }
    }
}
