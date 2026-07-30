pragma Singleton

import QtQuick

QtObject {
    property string version: "0.1.0"
    property string release: "alpha"
    property string shellVersion: "0.1.1"

    property real barHeight: Theme.s(40)
}
