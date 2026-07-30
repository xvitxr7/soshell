import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import qs.common

Item {
    id: root

    width:  rootLayout.width
    height: rootLayout.height

    ColumnLayout {
        id: rootLayout

        Text {
            id: hostNameGreet

            RandomMessage {
                id: tagline
                fileName: "taglines"
            }

            text: tagline.randomMessage(0)
            color: "white"
            antialiasing: true
            renderType: Text.NativeRendering

            font.weight: 600
            font.pointSize: Theme.s(9.1)
            font.family: "Adwaita Sans"
        }

        // big logo!
        Image {
            id: logo
            Layout.preferredWidth: Theme.s(530)
            Layout.preferredHeight: Theme.s(87)
            source: Paths.assets("bg/sos_logo.svg")
        }

        Version {
            Layout.topMargin: Theme.s(-20)
        }

        RowLayout {
            id: info
            spacing: Theme.s(10)

            Image {
                id: lineup1
                Layout.preferredWidth: Theme.s(228.7)
                Layout.preferredHeight: Theme.s(67)

                source: Paths.assets("bg/third_party_lineup1.svg")
            }

            SmallInfo {}

            Image {
                Layout.preferredWidth: Theme.s(447)
                Layout.preferredHeight: Theme.s(20)
                Layout.alignment: Qt.AlignBottom

                source: Paths.assets("bg/third_party_lineup2.svg")
            }
        }
    }
}
