import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
    id: root

    anchors {
        left: true
        right: true
        bottom: true
        top: true
    }
    
    width: rootLayout.width
    height: rootLayout.height

    aboveWindows: false

    color: "transparent"

    Timer {
        interval: 5000
        running: true
        repeat: false

        onTriggered: rootLayout.opacity = 0
    }

    // disable make the whole thing onec it disappears
    visible: rootLayout.opacity > 0

    ColumnLayout {
        id: rootLayout
        spacing: -6

        opacity: 1
        Behavior on opacity {
            NumberAnimation { duration: 1000 }
        }

        x: parent.width / 2 - rootLayout.width / 2
        y: 114

        Text {
            Layout.alignment: Qt.AlignHCenter
            FileView {
                id: messagesFile
                path: Quickshell.shellPath("assets/messages")
                blockLoading: true
            }

            property list<string> messages: messagesFile.text().split("\n")

            id: randomMessage

            text: messages[Math.floor(Math.random() * (messages.length - 1))]
            font.family: "Adwaita Sans"
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
                path: Quickshell.shellPath("assets/greets")
                blockLoading: true
            }

            FileView {
                id: greetEveningFile
                property list<string> lines: text().split("\n")
                path: Quickshell.shellPath("assets/greets_evening")
                blockLoading: true
            }

            FileView {
                id: greetMorningFile
                property list<string> lines: text().split("\n")
                path: Quickshell.shellPath("assets/greets_morning")
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
            font.pointSize: 40
            font.family: "Adwaita Sans"
            font.weight: 500
            renderType: Text.NativeRendering
            color: "white"
        }
    }
}
