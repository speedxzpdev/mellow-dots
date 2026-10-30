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

    Row {
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        Clock {
            width: 150
            height: 30
        }
        
        ProfileImage {
            radius: 16

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    Quickshell.execDetached(["sh", Quickshell.env("HOME") + "/.config/hypr/scripts/setIcon.sh"])
                }
            }
        }
    }
}