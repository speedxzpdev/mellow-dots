import QtQuick



Rectangle {

    Colors {
       id: pallete

       }

    property int padding: 10

    implicitWidth: clock.implicitWidth + padding * 2
    implicitHeight: clock.implicitHeight + padding * 2

    color: pallete.outline
    radius: 16

    


    Text {
        anchors.centerIn: parent
       id: clock
       text: Qt.formatDateTime(new Date(), "HH:mm:ss")
       color: pallete.text
       font.pixelSize: 20
       font.family: "JetBrainsMono"
       }

       Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            clock.text = Qt.formatDateTime(new Date(), "HH:mm:ss")
        }
}

}