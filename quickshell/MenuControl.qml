import Quickshell
import QtQuick

PanelWindow {
    id: root
     anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    exclusionMode: ExclusionMode.Ignore
    color: "transparent"

    focusable: true
    visible: false

    onVisibleChanged: {
    if (visible) {
        keyboardArea.forceActiveFocus()
    }
}

    Item {
        id: keyboardArea
        anchors.fill: parent
        focus: true
        Keys.onEscapePressed: {
           root.visible = false
           
        }
    }

    

    Colors {
        id: palette
    }

    Rectangle {

        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutQuad
            }
        }

        anchors.fill: parent
        color: palette.background
        opacity: root.visible ? 0.5 : 0

        Column {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50

            Clock {
                backgroundColor: "transparent"
                fontSize: 100
                textColor: '#ffffff'
                
            }

            Text {
                text: "Press ESC to return"
                font.pixelSize: 50
                color: '#ffffff'
                font.family: "JetBrains Mono"
            }
        }

        Grid {
            anchors.centerIn: parent

            spacing: 10
            columns: 3

            SetWallpaper {}
            Poweroff {}
            SetIcon {}

            
        }
        
    }
}