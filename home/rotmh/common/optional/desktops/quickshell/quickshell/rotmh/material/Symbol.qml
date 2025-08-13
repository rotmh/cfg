import QtQuick

import qs.config
import qs.widgets

StyledText {
    required property string name

    property real size: Appearance.font.size.smaller
    property bool fill: false

    renderType: Text.NativeRendering

    font {
        family: Appearance.font.family.material
        pointSize: size

        variableAxes: {
            "FILL": fill ? 1 : 0,
            // "wght"
            // "GRAD"
            "opsz": size,
        }
    }

    text: name
}
