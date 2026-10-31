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
            Quickshell.execDetached(["sh", Quickshell.env("HOME") + "/.config/hypr/scripts/wallpaper.sh"])
            menuControl.visible = false
        }
    }

    color: palette.primary
    opacity: 0.5

    Column {
        anchors.centerIn: parent
        spacing: 10

        Image {
            source: Quickshell.env("HOME") + "/.config/quickshell/assets/icons/wallpaper.svg"
            height: 50
            width: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Set Wallpaper"
            color: '#ffffff'
            font.pixelSize: 15
            font.family: "JetBrains Mono"
        }
    }
}