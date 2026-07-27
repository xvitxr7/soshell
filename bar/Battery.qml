import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.UPower
import "../common"

Rectangle {
    id: root

    width: Theme.s(80)
    height: Theme.s(30)

    radius: Theme.s(8)

    property var battery: UPower.devices.values[0]

    RowLayout {
        id: rootLayout
        anchors.centerIn: parent
        spacing: Theme.s(3)

        Image {
            function getIcon(charging: bool, charge: int): string {
                if (charging) return Theme.asset("bar/battery_charging.svg")

                if      (charge == 0)                return Theme.asset("bar/battery_empty.svg")
                else if (charge > 0 && charge < 30)  return Theme.asset("bar/battery_25.svg")
                else if (charge > 30 && charge < 60) return Theme.asset("bar/battery_50.svg")
                else if (charge > 60 && charge < 80) return Theme.asset("bar/battery_75.svg")
                else if (charge > 80)                return Theme.asset("bar/battery_full.svg")
            }

            Layout.preferredWidth: Theme.s(9.3)
            Layout.preferredHeight: Theme.s(15)

            source: getIcon(root.battery.state == UPowerDeviceState.Charging, root.battery.percentage * 100)
        }

        Text {
            text: root.battery.percentage * 100 + "%"
            font.family: "MartianMono Nerd Font Propo"
            font.weight: 900
            font.pointSize: Theme.s(12.2)
            color: "#263754"
        }

    }
}
