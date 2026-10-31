import Quickshell
import QtQuick

Rectangle {
    id: root

    Colors {
        id: palette
    }

    implicitHeight: 150
    implicitWidth: 150
    radius: 16

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["hyprlock"])
            menuControl.visible = false
        }
    }

    color: palette.primary
    opacity: 0.5

    Column {
        anchors.centerIn: parent
        spacing: 10

        Image {
            source: Quickshell.env("HOME") + "/.config/quickshell/assets/icons/lock.svg"
            height: 50
            width: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Lock"
            color: '#ffffff'
            font.pixelSize: 15
            font.family: "JetBrains Mono"
        }
    }
}