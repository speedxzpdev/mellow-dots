import QtQuick

Rectangle {
    id: root

    Colors {
        id: palette
    }

    // Default values
    property int padding: 10
    property int fontSize: 20
    property string fontFamily: "JetBrainsMono"
    property color backgroundColor: palette.outline
    property color textColor: palette.text

    implicitWidth: clock.implicitWidth + padding * 2
    implicitHeight: clock.implicitHeight + padding * 2

    color: backgroundColor
    radius: 16

    Text {
        id: clock
        anchors.centerIn: parent

        text: Qt.formatDateTime(new Date(), "HH:mm:ss")
        color: root.textColor

        font.pixelSize: root.fontSize
        font.family: root.fontFamily
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