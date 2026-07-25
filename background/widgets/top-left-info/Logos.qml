import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "."

PanelWindow {
    id: root

    aboveWindows: false

    anchors {
        top: true
        left: true
    }

    margins.left: 46
    margins.top: 80 - 40 // 40 being the top bar height

    width: rootLayout.width
    height: 400

    color: "transparent"

    Process {
        id: hostnameProcess
        running: true
        command: [ "uname", "-n" ]
        property string result;
        stdout: StdioCollector  {
            onStreamFinished: hostnameProcess.result = text.slice(0, -1)
        }
    }

    ColumnLayout {
        id: rootLayout

        RowLayout {
            Text {
                id: hostNameGreet

                function replaceGreetings(str) {
                    return str.replace("hostname", hostnameProcess.result)
                    // cool random error thingy!
                              .replace("randomhex", "0X" + (Math.random() * 656).toString(16).toUpperCase().slice(0, 6))
                }

                property list<string> greetings: [
                    "This is <b>hostname</b>, your personalized instance of",
                    "Welcome back to <b>hostname</b>, your personalized instance of",
                    "Long time no see! We hope you're excited to use",
                    "We just know you've been thinking of",
                    "Don't forget to keep your credit high on",
                    "ERROR#randomhex@hostname This is an error! Report this to Gaia Corp. immediately!"
                ]

                text: replaceGreetings(greetings[Math.floor(Math.random() * greetings.length)])
                color: "white"
                antialiasing: true
                renderType: Text.NativeRendering

                font.weight: 600
                font.pointSize: 10
                font.family: "Adwaita Sans"
            }
        }

        // big logo!
        RowLayout {
            Image {
                source: Quickshell.shellPath("assets/bg/sos_logo.svg")
            }
        }

        Version {}

        RowLayout {
            Layout.bottomMargin: -90
            Image {
                source: Quickshell.shellPath("assets/bg/third_party_lineup1.svg")
            }

            SmallInfo {}

            Image {
		    Layout.leftMargin: -30
                Layout.alignment: Qt.AlignBottom
                source: Quickshell.shellPath("assets/bg/third_party_lineup2.svg")
            }
        }
    }
}
