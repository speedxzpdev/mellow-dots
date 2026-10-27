import QtQuick
import Quickshell


PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 40
    exclusiveZone: 40

    Colors {
        id: palette
    }

    color: palette.background

    

    Row {
        spacing: 10
        anchors.centerIn: parent

        MusicPlayer {}

        
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        Image {
            source: "file://" + Quickshell.env("HOME") + "/speedDot/assets/icons/poweroff.svg"
        }

    }
}