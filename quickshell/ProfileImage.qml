import Quickshell
import QtQuick

Rectangle {
    width: 30
    height: 30
    clip: true

    property string customIcon: Quickshell.env("HOME") + "/.local/state/mellow-dots/icon.jpg"
    property string defaultIcon: Quickshell.env("HOME") + "/.config/quickshell/assets/template/icon.png"

    // Default icon
    Image {
        anchors.fill: parent

        source: "file://" + defaultIcon
        fillMode: Image.PreserveAspectCrop
    }

    // Custom icon
    Image {
        id: customImage

        anchors.fill: parent

        source: "file://" + customIcon
        fillMode: Image.PreserveAspectCrop

        visible: status === Image.Ready
    }
}