import Quickshell
import Quickshell.Io
import QtQuick

Item {
    id: root

    required property string fileName;
    readonly property list<string> messages: file.text().split('\n')

    FileView {
        id: file
        preload: false

        path: Paths.assets("txt/" + root.fileName)
        blockLoading: true
    }

    Process {
        id: hostnameProcess
        running: true
        command: [ "uname", "-n" ]

        property string result;

        stdout: StdioCollector  {
            onStreamFinished: hostnameProcess.result = text.slice(0, -1)
        }
    }

    function applyFormat(str: string): string {
        const hex = "0X" + (Math.random() * 65665).toString(16).toUpperCase().slice(0, 6)
        let user = Quickshell.env("USER")
        user = user.charAt(0).toUpperCase() + user.slice(1)

        return str
                .replace("HOST", hostnameProcess.result)
                .replace("USER", user)
                .replace("HEX", hex)
    }

    function randomMessage(): string {
        const message = messages[Math.floor(Math.random() * (messages.length - 1))]
        return applyFormat(message)
    }
}
