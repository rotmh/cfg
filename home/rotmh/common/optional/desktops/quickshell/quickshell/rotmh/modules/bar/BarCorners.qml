import QtQuick

import qs.modules.common.widgets
import qs.config

Item {
    y: BarConfig.position == BarConfig.Position.Top ? BarConfig.height : 0

    implicitHeight: BarConfig.rounding
    implicitWidth: parent.width

    RoundCorner {
        id: leftCorner

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        corner: BarConfig.position == BarConfig.Position.Top ? RoundCorner.Corner.TopLeft : RoundCorner.Corner.BottomLeft
        color: BarConfig.bgColor
        size: BarConfig.rounding
    }

    RoundCorner {
        id: rightCorner

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        corner: BarConfig.position == BarConfig.Position.Top ? RoundCorner.Corner.TopRight : RoundCorner.Corner.BottomRight
        color: BarConfig.bgColor
        size: BarConfig.rounding
    }
}
