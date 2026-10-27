import Quickshell
import QtQuick
import QtQuick.Controls

PanelWindow {
    id: root

    property string iconWallpaper: "file://" + Quickshell.env("HOME") + "/speedDot/assets/icons/wallpaper.svg"
    property string iconPoweroff: "file://" + Quickshell.env("HOME") + "/speedDot/assets/icons/poweroff.svg"

    anchors {
        left: true
        bottom: true
    }

    implicitWidth: 320
    implicitHeight: 240
    color: "transparent"

    Colors {
        id: pallete
    }

    // Área invisível para detectar o mouse
    Item {
        anchors.fill: parent

        HoverHandler {
    id: hoverHandler
}

        // Painel visual: continua com 260 x 180
        Rectangle {
            id: panel

            

            width: hoverHandler.hovered ? 260 : 0
            height: hoverHandler.hovered ? 180 : 0
            opacity: hoverHandler.hovered ? 100 : 0
        

            anchors {
                left: parent.left
                bottom: parent.bottom
            }


            

            Behavior on width {
        NumberAnimation {
        duration: 250
        easing.type: Easing.OutCubic
    }}

    Behavior on height {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutCubic
        }
    }

           Behavior on opacity {
    NumberAnimation {
        duration: 200
        easing.type: Easing.OutCubic
    }
}

            
            color: pallete.background
            radius: 16

            Column {
                spacing: 10
                anchors.centerIn: parent

                Clock {}
                VolumeBar {}

                Text {
                    text: "SpeedDot!"
                    color: pallete.text
                    font.pixelSize: 20
                    font.family: "JetBrainsMono"
                }
            }

            Column {
                
                spacing: 10
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: 16
                }
                Image {

                    Behavior on scale {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }

                    scale: mouseArea.containsMouse ? 1.5 : 1.0
                

                width: 24
                height: 24

                source: Qt.resolvedUrl(root.iconWallpaper)
                fillMode: Image.PreserveAspectFit
                

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Quickshell.execDetached([
                            "sh",
                            Quickshell.env("HOME") + "/.config/hypr/scripts/wallpaper.sh"
                        ])
                    }

                    ToolTip {
                        visible: mouseArea.containsMouse
                        text: "Change wallpaper"
                        delay: 500
                        timeout: 3000
                    }
                }
            }

            Image {

                Behavior on scale {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
                

                width: 24
                height: 24

                source: Qt.resolvedUrl(root.iconPoweroff)
                fillMode: Image.PreserveAspectFit
                scale: mouseAreaPowerfull.containsMouse ? 1.5 : 1.0

                MouseArea {
                    id: mouseAreaPowerfull
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Quickshell.execDetached([
                            "systemctl", "poweroff"
                        ])
                    }

                    ToolTip {
                        visible: mouseAreaPowerfull.containsMouse
                        text: "Power off"
                        delay: 500
                        timeout: 3000
                    }
                }
            }

            }
        }
    }
}