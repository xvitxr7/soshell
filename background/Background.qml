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

    Loader {
        id: greetWidgetLoader
        anchors.horizontalCenter: parent.horizontalCenter

        sourceComponent: Widgets.Greet {
            id: greetWidget
        }

        Connections {
            target: greetWidgetLoader.item
            function onDisappear() { greetWidgetLoader.sourceComponent = undefined; console.log("Background: GreetWidget Unloaded!") }
        }
    }

    ColumnLayout {
        x: Theme.s(46)
        y: Theme.s(80) - Config.barHeight
        spacing: Theme.s(18.7)

        InfoWidgets.Logos { id: logos }
        Slates { id: slates }
    }

    Widgets.Clock {}


}
