
import QtQuick
import QtQuick.Controls
import Quickshell

Rectangle {
    id: root

    Colors {
        id: palette
    }

    implicitWidth: 190
    implicitHeight: 42

    radius: 12
    color: palette.surface

    Slider {
        id: volumeSlider

        anchors {
            fill: parent
            leftMargin: 14
            rightMargin: 14
        }

        from: 0
        to: 1
        value: 0.4

        background: Rectangle {
            x: volumeSlider.leftPadding
            y: volumeSlider.topPadding
                + volumeSlider.availableHeight / 2
                - height / 2

            width: volumeSlider.availableWidth
            height: 5

            radius: 3
            color: palette.outline

            Rectangle {
                width: volumeSlider.visualPosition * parent.width
                height: parent.height

                radius: 3
                color: palette.primary
            }
        }

        handle: Rectangle {
            x: volumeSlider.leftPadding
                + volumeSlider.visualPosition
                * (volumeSlider.availableWidth - width)

            y: volumeSlider.topPadding
                + volumeSlider.availableHeight / 2
                - height / 2

            implicitWidth: 12
            implicitHeight: 12

            radius: 6
            color: volumeSlider.pressed
                ? palette.text
                : palette.primary

            scale: volumeSlider.pressed ? 1.15 : 1.0

            Behavior on scale {
                NumberAnimation {
                    duration: 120
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: 120
                }
            }
        }

        onPressedChanged: {
            if (!pressed) {
                Quickshell.execDetached([
                    "wpctl",
                    "set-volume",
                    "@DEFAULT_AUDIO_SINK@",
                    value.toFixed(2)
                ])
            }
        }
    }
}
