import QtQuick
import QtQml
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import "../common"

Rectangle {
    id: root

    implicitWidth: rootLayout.width + Theme.s(25)
    Behavior on implicitWidth {
        NumberAnimation { duration: 250; easing: Easing.InOutCubic }
    }

    implicitHeight: Theme.s(30)

    radius: 5

    property var defaultSink: Pipewire.defaultAudioSink

    PwObjectTracker {
	    objects: [ defaultSink ]
    }

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent
        spacing: Theme.s(10)

        Image {
            id: audioIcon

            function getIcon(): string {
                const volume = root.defaultSink.audio.volume

                if (root.defaultSink.audio.muted || volume <= 0)
                    return "bar/audio_muted.svg"


                if (volume > 0 && volume < 0.33)
                    return "bar/audio_low.svg"
                else if (volume >= 0.33 && volume < 0.66)
                    return "bar/audio_medium.svg"
                else
                    return "bar/audio_high.svg"
            }

            source: Theme.asset(getIcon())
        }

        Text {
            id: volumeText

            text: Math.round(root.defaultSink.audio.volume * 100) + "%"
            font.family: "MartianMono Nerd Font Propo"
            font.weight: 900
            font.pointSize: Theme.s(12.2)

            color: "#263754"
        }

    }

    MouseArea {
	    id: mouse
	    anchors.fill: parent
	    hoverEnabled: true

	    onWheel: (event) => root.defaultSink.audio.volume = Math.min(1, root.defaultSink.audio.volume + (event.angleDelta.y * 1e-4))
    }
}
