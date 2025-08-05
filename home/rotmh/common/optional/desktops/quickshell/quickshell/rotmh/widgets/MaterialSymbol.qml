import QtQuick

import qs.config

StyledText {
    required property string name

    property real size: Appearance.font.size.normal
    property bool fill: false

    renderType: Text.NativeRendering
    verticalAlignment: Text.AlignVCenter

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
