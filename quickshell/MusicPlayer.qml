import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    id: root
    
    readonly property var player: {
        const player = Mpris.players.values
        return player.find(p => p.isPlaying) ?? player[0] ?? null
    }

    Colors {
        id: palette
    }

    color: palette.outline


    implicitWidth: 200
    implicitHeight:30 
    radius: 16

    Row {
        spacing: 5

        anchors.centerIn: parent
        


        Image {
            source: "file://" + Quickshell.env("HOME") + "/speedDot/assets/icons/" + (root.player ? "musicPlaying.svg" : "musicPlayerOff.svg")
        }

        
Item {
    width: 140
    height: 30
    clip: true

    Text {
        id: trackTitle

        text: root.player ? root.player.trackTitle : "No music playing"
        color: palette.text
        font.family: "JetBrainsMono"

        anchors.verticalCenter: parent.verticalCenter

        x: 0

        NumberAnimation on x {
            from: 0
            to: Math.min(0, parent.width - trackTitle.width)
            duration: 4000
            loops: Animation.Infinite
            running: trackTitle.width > parent.width
        }
    }
}

    }


}