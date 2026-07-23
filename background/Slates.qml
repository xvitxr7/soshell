import QtQuick
import Quickshell

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

    Slate {
        x: 42
        y: 291

        slateId: 2
    }

    Slate {
        x: 42
        y: 471

        slateId: 8
    }

    Slate {
        x: 42
        y: 622

        slateId: 7
    }

    Slate {
        x: 248
        y: 622

        slateId: 6
    }

    Slate {
        x: 1076
        y: 177

        slateId: 1
    }

    Slate {
        x: 1594
        y: 177

        slateId: 3
    }

    Slate {
        x: 1076
        y: 622

        slateId: 4
    }

    Slate {
        x: 1592
        y: 622

        slateId: 5
    }
}
