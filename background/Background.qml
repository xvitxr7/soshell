import QtQuick
import Quickshell

PanelWindow {
    id: root

    property bool animate: true
    property real fps: 20
    property real circleRadius: 7
    property real xSpeed: 4
    property real ySpeed: 4
    property real xOffset: 20
    property real yOffset: 20
    property real xDelta: 0
    property real yDelta: 0

    aboveWindows: false
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    // animated halftone
    Canvas {
        id: backgroundCanva
        width: parent.width
        height: parent.height
        onPaint: {
            var ctx = getContext("2d");
            const grad = ctx.createRadialGradient(20, root.height, root.width, root.width, 0, 300)
            grad.addColorStop(0, Qt.hsla(1, 0.45, 0.91, 1))
            grad.addColorStop(1, Qt.hsla(0.61, 0.41, 0.48, 1))
            ctx.fillStyle = grad;
            ctx.fillRect(0, 0, root.width, root.height);

            ctx.fillStyle = Qt.hsla(0, 0, 1, 0.1)
            for (var y = root.yDelta; y < root.height + root.circleRadius; y += root.circleRadius * 2 + root.yOffset) {
                for (var x = root.xDelta; x < root.width + root.circleRadius; x += root.circleRadius * 2 + root.xOffset) {
                    ctx.beginPath();
                    ctx.arc(x, y, root.circleRadius, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }

            root.xDelta -= root.xSpeed / 10
            root.yDelta -= root.ySpeed / 10
        }
    }

    Timer {
        interval: 1000 / root.fps
        running: root.animate
        repeat: true

        onTriggered: backgroundCanva.requestPaint()
    }

    Slates {}
}
