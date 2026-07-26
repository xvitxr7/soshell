import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../../../common"

Item {
    id: root

    width:  rootLayout.width
    height: rootLayout.height

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
            font.pointSize: Theme.s(9.1)
            font.family: "Adwaita Sans"
        }

        // big logo!
        Image {
            id: logo
            fillMode: Image.PreserveAspectFit
            Layout.topMargin: Theme.s(-20)
            Layout.preferredWidth: Theme.s(530)
            source: Quickshell.shellPath("assets/bg/sos_logo.svg")
        }

        Version {
            Layout.topMargin: Theme.s(-40)
        }

        RowLayout {
            id: info
            Layout.topMargin: Theme.s(-10)
            Layout.preferredHeight: lineup1.height

            Image {
                id: lineup1
                Layout.preferredWidth: Theme.s(228.7)
                Layout.preferredHeight: Theme.s(67)
                source: Quickshell.shellPath("assets/bg/third_party_lineup1.svg")
            }

            SmallInfo {}

            Image {
                Layout.preferredWidth: Screen.width * 0.2
                Layout.preferredHeight: Screen.height * 0.015
                Layout.alignment: Qt.AlignBottom

                source: Quickshell.shellPath("assets/bg/third_party_lineup2.svg")
            }
        }
    }
}
