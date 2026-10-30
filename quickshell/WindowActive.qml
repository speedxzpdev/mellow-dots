import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle {
    Colors {
        id: palette
    }

    implicitWidth: 200
    implicitHeight: 30
    radius: 16

    color: palette.outline

    Column {
        anchors.centerIn: parent
        spacing: 5
        ScrollingText {
            text: Hyprland.activeToplevel?.title ?? "Desktop"
            color: palette.text
            font.family: "JetBrainsMono"
            font.pixelSize: 15
        }
    }


}