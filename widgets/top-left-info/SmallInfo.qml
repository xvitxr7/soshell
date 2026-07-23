import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../../"

Item {
    id: root

    Layout.alignment: Qt.AlignTop

    width: rootLayout.width
    height: rootLayout.height

    ColumnLayout {
        id: rootLayout
	spacing: 3

        Text {
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
            font.pointSize: 7
            font.family: "MartianMono Nerd Font"
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
            font.pointSize: 7
            font.family: "MartianMono Nerd Font"
            color: "white"
            renderType: Text.NativeRendering
        }

        Text {
            text: "USING SOSHELL_" + Config.shellVersion
            font.pointSize: 7
            font.family: "MartianMono Nerd Font"
            color: "white"
            renderType: Text.NativeRendering
        }

	Text {
            text: "USING DUSQKRNL_7.3.0b"
            font.pointSize: 7
            font.family: "MartianMono Nerd Font"
            color: "white"
            renderType: Text.NativeRendering
        }

        Image {
            source: Quickshell.shellPath("assets/small_info_rects.svg")
        }
    }
}
