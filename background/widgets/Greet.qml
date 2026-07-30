import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import qs.common

Item {
    id: root

    y: Theme.s(70)

    width: rootLayout.width
    height: rootLayout.height

    // fade out logic
    signal disappear()
    opacity: 1

    NumberAnimation on opacity {
        running: false
        id: fadeOut
        to: 0;
        duration: 2000;
        easing.type: Easing.Linear

        onFinished: root.disappear()
    }

    Timer {
        id: fadeOutTimer

        interval: 10000
        running: true
        repeat: false

        onTriggered: fadeOut.start()
    }

    ColumnLayout {
        id: rootLayout
        spacing: -6

        opacity: parent.opacity

        anchors.centerIn: parent

        Text {
            Layout.alignment: Qt.AlignHCenter

            FileView {
                id: messagesFile
                path: Quickshell.shellPath("assets/txt/messages")
                blockLoading: true
            }

            property list<string> messages: messagesFile.text().split("\n")

            id: randomMessage

            text: messages[Math.floor(Math.random() * (messages.length - 1))]
            font.family: Fonts.inter.font.family
            font.pointSize: Theme.s(16)
            color: "white"
        }

        Text {
            id: randomGreet

            SystemClock {
                id: clock
            }

            RandomMessage {
                id: greets
                fileName: "greets"
            }

            RandomMessage {
                id: eveningGreets
                fileName: "greets_evening"
            }

            RandomMessage {
                id: morningGreets
                fileName: "greets_morning"
            }

            function greetOnTimeOfDay(): string {
                const r = Math.random()
                if (r > 0.5) {
                    if (clock.hours > 0 && clock.hours < 13)
                        return morningGreets.randomMessage()
                    else if (clock.hours > 12 && clock.hours <= 23)
                        return morningGreets.randomMessage()
                }

                return greets.randomMessage()
            }

            text: greetOnTimeOfDay()
            font.pointSize: Theme.s(50)
            font.family: "Adwaita Sans"
            font.weight: 500
            renderType: Text.NativeRendering
            color: "white"
        }
    }
}
