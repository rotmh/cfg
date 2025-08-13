import QtQuick
import QtQuick.Layouts

import qs.config
import qs.material
import qs.services

Item {
    id: root

    property color color: Appearance.palette.onSecondaryContainer_

    implicitHeight: iconsRow.implicitHeight
    implicitWidth: iconsRow.implicitWidth

    RowLayout {
        id: iconsRow

        anchors {
            verticalCenter: parent.verticalCenter
        }

        spacing: Appearance.spacing.smaller / 2

        Symbol {
            name: Bluetooth.connected ? "bluetooth_connected" : Bluetooth.enabled ? "bluetooth" : "bluetooth_disabled"
            color: root.color
        }
    }
}
