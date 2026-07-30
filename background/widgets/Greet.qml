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

            FileView {
                id: greetMessagesFile
                property list<string> lines: text().split("\n")
                path: Quickshell.shellPath("assets/txt/greets")
                blockLoading: true
            }

            FileView {
                id: greetEveningFile
                property list<string> lines: text().split("\n")
                path: Quickshell.shellPath("assets/txt/greets_evening")
                blockLoading: true
            }

            FileView {
                id: greetMorningFile
                property list<string> lines: text().split("\n")
                path: Quickshell.shellPath("assets/txt/greets_morning")
                blockLoading: true
            }

            function applyFormat(str) {
                return str.replace("USER", Quickshell.env("USER"))
            }

            function greetOnTimeOfDay() {
                const r = Math.random()
                if (r > 0.5) {
                    if (clock.hours > 0 && clock.hours < 13)
                        return greetMorningFile.lines
                    else if (clock.hours > 12 && clock.hours <= 23)
                        return greetEveningFile.lines
                }

                return greetMessagesFile.lines
            }

            property var greets;
            Component.onCompleted: greets = greetOnTimeOfDay()

            text: applyFormat(greets[Math.floor(Math.random() * (greets.length - 1))])
            font.pointSize: Theme.s(50)
            font.family: "Adwaita Sans"
            font.weight: 500
            renderType: Text.NativeRendering
            color: "white"
        }
    }
}
