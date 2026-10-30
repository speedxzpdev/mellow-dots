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
        anchors.left: parent.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        WindowActive {}
        Workspaces {}

    }
}