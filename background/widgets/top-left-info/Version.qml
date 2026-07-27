import QtQuick
import Quickshell
import QtQuick.Layouts
import "../../../common"

Item {
    id: root
    height: layoutRoot.height

    RowLayout {
        id: layoutRoot
        spacing: Theme.s(6)

        Text {
            id: versionText

            text: "VERSION " + Config.version
            font.family: "Medium"
            font.pointSize: Theme.s(14.3)
            color: "white"
            antialiasing: false
        }

        Image {
            id: release
            Layout.preferredWidth: Theme.s(56)
            Layout.preferredHeight: Theme.s(17)

            source: Config.release == "alpha" ? Quickshell.shellPath("assets/bg/alpha_emblem.svg") : ""
        }

        Image {
            Layout.preferredWidth: Theme.s(75)
            Layout.preferredHeight: Theme.s(17)

            source: Quickshell.shellPath("assets/bg/2026.svg")
        }
    }
}
