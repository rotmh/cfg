import QtQuick

import qs.config

Rectangle {
    id: root

    property var onClicked

    Ripple {
        // color: Appearance.palette.
        onClicked: root.onClicked
    }
}
