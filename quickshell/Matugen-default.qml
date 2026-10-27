import QtQuick

QtObject {
    readonly property color primary: "{{colors.primary.default.hex}}"
    readonly property color secondary: "{{colors.secondary.default.hex}}"

    readonly property color background: "{{colors.background.default.hex}}"
    readonly property color surface: "{{colors.surface.default.hex}}"

    readonly property color text: "{{colors.on_background.default.hex}}"
    readonly property color outline: "{{colors.outline.default.hex}}"
}