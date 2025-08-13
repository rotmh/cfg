import QtQuick

import qs
import qs.config
import qs.widgets
import qs.material

Item {
    anchors {
        left: parent.left
        right: parent.right
        top: BarConfig.position === BarConfig.Position.Top ? parent.top : undefined
        bottom: BarConfig.position === BarConfig.Position.Bottom ? parent.bottom : undefined
    }

    implicitHeight: BarConfig.height

    Rectangle {
        anchors.fill: parent
        color: BarConfig.bg
    }

    Button {
        content: Symbol {
            name: "bluetooth"
        }
    }

    MouseArea {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right

            leftMargin: Appearance.padding.normal
            rightMargin: Appearance.padding.normal
        }

        implicitWidth: statusIconsRoot.implicitWidth
        implicitHeight: statusIconsRoot.implicitHeight

        onPressed: event => {
            switch (event.button) {
            case Qt.LeftButton:
                GlobalState.rightSidebarOpen = !GlobalState.rightSidebarOpen;
                break;
            }
        }

        StyledRect {
            id: statusIconsRoot

            anchors.centerIn: parent
            implicitWidth: statusIcons.implicitWidth + Appearance.padding.smaller * 2
            implicitHeight: statusIcons.implicitHeight + Appearance.padding.small * 2

            color: Appearance.palette.secondaryContainer
            radius: Appearance.rounding.full

            StatusIcons {
                id: statusIcons
                anchors.centerIn: parent
            }
        }
    }
}
