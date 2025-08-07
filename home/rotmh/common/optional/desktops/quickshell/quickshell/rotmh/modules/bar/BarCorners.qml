import QtQuick

import qs.config
import qs.widgets

Item {
    id: root

    y: BarConfig.position === BarConfig.Position.Top ? BarConfig.height : 0

    implicitHeight: BarConfig.rounding
    implicitWidth: parent.width

    readonly property color bg: BarConfig.bg
    readonly property int size: BarConfig.rounding

    RoundCorner {
        id: leftCorner

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        corner: BarConfig.position === BarConfig.Position.Top ? RoundCorner.Corner.TopLeft : RoundCorner.Corner.BottomLeft
        color: root.bg
        size: root.size
    }

    RoundCorner {
        id: rightCorner

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        corner: BarConfig.position === BarConfig.Position.Top ? RoundCorner.Corner.TopRight : RoundCorner.Corner.BottomRight
        color: root.bg
        size: root.size
    }
}
