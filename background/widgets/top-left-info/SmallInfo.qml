import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../../../common"

Item {
    id: root

    Layout.alignment: Qt.AlignTop

    width: rootLayout.width / 1.2
    height: rootLayout.height

    ColumnLayout {
        id: rootLayout
        spacing: Theme.s(4)

        property real fontSize: Theme.s(7)

        Text {
            id: uptimeText

            Process {
                id: uptimeProcess
                running: true
                command: [ "uptime", "-p" ]
                property string result;
                stdout: StdioCollector  {
                    onStreamFinished: uptimeProcess.result = text
                }
            }

            Timer {
                interval: 60000
                running: true
                repeat: true

                onTriggered: uptimeProcess.running = true
            }

            text: uptimeProcess.result.toUpperCase().trim() // slice to remove random comma
            font.pointSize: rootLayout.fontSize
            font.family: "MartianMono Nerd Font Propo"
            color: "white"
            renderType: Text.NativeRendering

        }

        Text {
            Process {
                id: versionProcess
                running: true
                command: [ "quickshell", "-V" ]
                property string result;
                stdout: StdioCollector  {
                    onStreamFinished: versionProcess.result = text
                }
            }

            text: "POWERED_BY QSHELL_" + versionProcess.result.split(" ")[1]
            font.pointSize: rootLayout.fontSize
            font.family: "MartianMono Nerd Font Propo"
            color: "white"
            renderType: Text.NativeRendering
        }

        Text {
            text: "USING SOSHELL_" + Config.shellVersion + "a"
            font.pointSize: rootLayout.fontSize
            font.family: "MartianMono Nerd Font Propo"
            color: "white"
            renderType: Text.NativeRendering
        }

        Text {
            text: "USING DUSQKRNL_7.3.0b"
            font.pointSize: rootLayout.fontSize
            font.family: "MartianMono Nerd Font Propo"
            color: "white"
            renderType: Text.NativeRendering
        }

        Image {
            Layout.preferredWidth: Theme.s(141)
            Layout.preferredHeight: Theme.s(10)
            source: Quickshell.shellPath("assets/bg/small_info_rects.svg")
        }
    }
}
