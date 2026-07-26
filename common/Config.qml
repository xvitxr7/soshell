pragma Singleton

import QtQuick

Item {
    property bool animateBackground: true

    property string version: "0.1.0"
    property string release: "alpha"
    property string shellVersion: "0.1.0"

    property real barHeight: Screen.height * 0.04 // 4% of the screen only
}
