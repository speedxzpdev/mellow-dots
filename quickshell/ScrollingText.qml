import QtQuick
import Quickshell

Item {
    id: root

    property string text: ""
    property color textColor: "white"
    property int pixelSize: 20
    property string fontFamily: "JetBrainsMono Nerd Font"
    property color color: "white"
    property font font: Qt.font({
    family: "JetBrainsMono",
    pixelSize: 15
})

    property int scrollSpeed: 50

    width: 180
    height: 30

    clip: true

    Text {
        id: label

        text: root.text
        color: root.color
        font: root.font

        height: parent.height
        verticalAlignment: Text.AlignVCenter


        x: 0
    }

    NumberAnimation {
        id: scrollAnimation

        target: label
        property: "x"

        from: 0
        to: Math.min(0, root.width - label.width)

        duration: Math.max(1000, Math.abs(root.width - label.width) / root.scrollSpeed * 1000)

        loops: Animation.Infinite
        running: label.width > root.width

        onFinished: label.x = 0
    }
}