import QtQuick
import Quickshell
import QtQuick.Layouts
import "../../" as Root

Item {
    id: root

    RowLayout {
        id: layoutRoot
        y: -12
        spacing: 10

        Text {
            id: versionText

            text: "VERSION " + Root.Config.version
            font.family: "Medium"
            font.pointSize: 13.5
            color: "white"
            antialiasing: false
            renderType: Text.CurveRendering
        }

        Image {
            source: Root.Config.release == "alpha" ? Quickshell.shellPath("assets/alpha_emblem.svg") : ""
        }

        Image {
            source: Quickshell.shellPath("assets/2026.svg")
        }
    }
}
