import Quickshell
import QtQuick
import Quickshell.Hyprland

Row {
    spacing: 10
    Repeater {
        model: 5

        Rectangle {
           Colors {
             id: palette
            }

            id: root

            property int workNumber: index + 1

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    Hyprland.dispatch(
                       `hl.dsp.focus({ workspace = "${root.workNumber}" })`
                    ) 
                }
            }

            

            HoverHandler {
                id: hoverHandler
            }

            color: hoverHandler.hovered || Hyprland.focusedWorkspace?.id === index + 1 ? palette.primary : palette.outline

            implicitHeight: 30
            implicitWidth: 30
            radius: 16

            Text {
                id: workIndex
                anchors.centerIn: parent
                text: index + 1
                color: hoverHandler.hovered || Hyprland.focusedWorkspace?.id === index + 1 ? "#000000" : palette.text
                font.family: "JetBrains Mono"
            }


        }

    }
}