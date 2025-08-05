import QtQuick

import qs.config
import qs.widgets

Item {
    anchors {
        left: parent.left
        right: parent.right
        top: BarConfig.position == BarConfig.Position.Top ? parent.top : undefined
        bottom: BarConfig.position == BarConfig.Position.Bottom ? parent.bottom : undefined
    }

    implicitHeight: BarConfig.height

    Rectangle {
        anchors.fill: parent
        color: BarConfig.bgColor
    }

    StyledRect {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right

            leftMargin: Appearance.padding.normal
            rightMargin: Appearance.padding.normal
        }

        // color: Appearance.palette.secondaryContainer
        // radius: Appearance.rounding.full
        implicitWidth: statusIcons.implicitWidth + Appearance.padding.normal * 2

        StatusIcons {
            id: statusIcons

            anchors.centerIn: parent
        }
    }
}
