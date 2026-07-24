import QtQuick
import Quickshell
import "widgets" as Widgets
import "user-slate" as UserSlate
import "widgets/top-left-info" as TopLeftInfo

PanelWindow {
    id: root

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
}
