import QtQuick
import QtQuick.Layouts
import QtMultimedia
import Quickshell
import "widgets" as Widgets
import "widgets/top-left-info" as TopLeftInfo
import "../common"

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

    Widgets.Greet {}

    ColumnLayout {
        x: Theme.s(46)
        y: Theme.s(80) - Config.barHeight // 40 being the top bar height
        spacing: Theme.s(18.7)

        TopLeftInfo.Logos { id: logos }
        Slates { id: slates }
    }

    Widgets.Clock {}


}
