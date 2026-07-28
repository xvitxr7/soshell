import QtQuick
import QtQml
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick.Effects
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris
import "../common"

Item {
    id: root
    implicitWidth: volume.width + mpris.width
    implicitHeight: volume.height

    property var defaultSink: Pipewire.defaultAudioSink
    PwObjectTracker {
        objects: [ defaultSink ]
    }


    property var player: Mpris.players.values[0]

    RowLayout {
        spacing: -10

        Rectangle {
            id: volume

            Layout.preferredWidth: rootLayout.width + Theme.s(25)
            Behavior on Layout.preferredWidth {
                NumberAnimation { duration: 250; easing: Easing.InOutCubic }
            }

            Layout.preferredHeight: Theme.s(30)

            radius: 5


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
                acceptedButtons: Qt.RightButton

                onWheel: (event) => root.defaultSink.audio.volume = Math.min(1, root.defaultSink.audio.volume + (event.angleDelta.y * 1e-4))
                onPressed: root.defaultSink.audio.muted = !root.defaultSink.audio.muted
            }
        }

        Rectangle {
            id: mpris
            z: -1

            Layout.preferredWidth: Mpris.players.values.length == 0 ? 0 : mprisRootLayout.width + Theme.s(25)
            Behavior on Layout.preferredWidth {
                NumberAnimation { duration: 250; easing: Easing.InOutCubic }
            }

            Layout.preferredHeight: Theme.s(30)

            radius: 5
            color: "#263754"

            function trimTitle(title: string): string {
                if (title.length > 20)
                    title = title.slice(0, 20) + "..."
                return title
            }

            RowLayout {
                id: mprisRootLayout
                anchors.verticalCenter: parent.verticalCenter
                x: 20

                Text {
                    text: mpris.trimTitle(root.player.trackTitle) || "Unknown Title"

                    font.family: "MartianMono Nerd Font Propo"
                    font.weight: 900
                    font.pointSize: Theme.s(12.2)
                    color: "white"
                }

                Rectangle {
                    visible: mpris.Layout.preferredWidth > 0 && root.player.trackArtist.length > 0

                    Layout.preferredWidth: artistText.width + 5
                    Layout.preferredHeight: artistText.height + 5

                    radius: 2
                    color: "white"

                    Text {
                        id: artistText
                        anchors.centerIn: parent

                        text: mpris.trimTitle(root.player.trackArtist)

                        font.family: "MartianMono Nerd Font Propo"
                        font.weight: 900
                        font.pointSize: Theme.s(7.6)
                        color: mpris.color
                    }
                }

                Image {
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50
                    Layout.bottomMargin: -10

                    source: Quickshell.iconPath(root.player.desktopEntry)

                    MultiEffect {
                        source: parent
                        anchors.fill: parent
                        saturation: -1.0
                        contrast: 0.7
                    }
                }
            }
        }
    }

}
