import QtQuick
import QtMultimedia
import Quickshell
import "widgets" as Widgets
import "user-slate" as UserSlate
import "widgets/top-left-info" as TopLeftInfo

PanelWindow {
    id: root

    margins.top: -40

    aboveWindows: false
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    color: "transparent"

    // animated halftone
    CustomShaderBackground {}

    Widgets.Greet {}

    TopLeftInfo.Logos {}
    Widgets.Clock {}

    Slates {}

    UserSlate.User {}

    Video {
        id: video
        width : 800
        height : 600
        source: Quickshell.shellPath("assets/bg/animald00ds.mov")
    }
}
