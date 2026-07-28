import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.UPower
import "../common"

Rectangle {
    id: root

    implicitWidth: rootLayout.width + Theme.s(25)
    Behavior on implicitWidth {
        NumberAnimation { duration: 250; easing: Easing.InOutCubic }
    }

    implicitHeight: Theme.s(30)

    radius: 5

    property var battery: UPower.devices.values[0]

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent
        spacing: Theme.s(3)

        Image {
            id: batteryIcon

            function getIcon(charging: bool, charge: int): string {
                if (charging) return Theme.asset("bar/battery_charging.svg")

                if      (charge == 0)                return Theme.asset("bar/battery_empty.svg")
                else if (charge >= 0 && charge < 30)  return Theme.asset("bar/battery_25.svg")
                else if (charge >= 30 && charge < 60) return Theme.asset("bar/battery_50.svg")
                else if (charge >= 60 && charge < 80) return Theme.asset("bar/battery_75.svg")
                else if (charge >= 80)                return Theme.asset("bar/battery_full.svg")
            }

            Layout.preferredWidth: Theme.s(9.3)
            Layout.preferredHeight: Theme.s(15)

            source: getIcon(root.battery.state == UPowerDeviceState.Charging, root.battery.percentage * 100)
        }

        Text {
            id: batteryChargeText

            function getTimeRemaining(): string {
                if (root.battery.percentage == 1)
                    return "Battery full, enjoy!"
                if (root.battery.state == UPowerDeviceState.Charging)
                    if (root.battery.timeToFull == 0)
                        return "Calculating time remaining..."
                    else
                        return Math.round(root.battery.timeToFull / 60) + " minutes until full (" + Math.round(root.battery.changeRate * 100) / 100 + " W)"
                else
                    if (root.battery.timeToEmpty == 0)
                        return "Calculating time remaining..."
                    else
                        return Math.round(root.battery.timeToEmpty / 60) + " minutes remaining (-" + Math.round(root.battery.changeRate * 100) / 100 + " W)"
            }

            text: mouse.containsMouse ? getTimeRemaining() : Math.round(root.battery.percentage * 100) + "%"
            font.family: "MartianMono Nerd Font Propo"
            font.weight: 900
            font.pointSize: Theme.s(12.2)

            color: "#263754"
        }

    }

    SequentialAnimation {
        id: hoverAnimation
        NumberAnimation { target: batteryChargeText; property: "opacity"; to: 0; duration: 0 }
        NumberAnimation { target: batteryChargeText; property: "opacity"; to: 1; duration: 600 }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true

        onEntered: hoverAnimation.start()
        onExited: hoverAnimation.start()
    }
}
