import QtQuick
import QtQuick.Layouts
import QtMultimedia
import Quickshell

import qs.common
import qs.background.widgets as Widgets
import qs.background.widgets.info as InfoWidgets

PanelWindow {
    id: rootBackgroundPanel

    aboveWindows: false
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    color: "transparent"

    LazyLoader {
        loading: true
        Widgets.Greet {}
    }

    ColumnLayout {
        x: Theme.s(46)
        y: Theme.s(80) - Config.barHeight // 40 being the top bar height
        spacing: Theme.s(18.7)

        InfoWidgets.Logos { id: logos }
        Slates { id: slates }
    }

    Widgets.Clock {}


}
