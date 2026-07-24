import QtQuick
import Quickshell

Item {
    id: root
    anchors.fill: parent

    Rectangle {
        id: surface
        anchors.fill: parent

        layer.enabled: true
        layer.effect: ShaderEffect {
            fragmentShader: Quickshell.shellPath("assets/shaders/test.frag.qsb")
        }
    }
}
