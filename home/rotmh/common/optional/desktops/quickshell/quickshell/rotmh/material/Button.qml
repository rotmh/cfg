pragma ComponentBehavior: Bound

import QtQuick

import qs.widgets
import qs.config

Rectangle {
    id: root

    anchors.verticalCenter: parent.verticalCenter

    property var onClicked
    property Component content

    property bool isIcon: false

    property int rounding: Appearance.rounding.full

    property int hPadding: Appearance.padding.smaller
    property int vPadding: Appearance.padding.small

    implicitHeight: buttonContent.implicitHeight + vPadding * 2
    implicitWidth: isIcon ? root.implicitHeight : buttonContent.implicitWidth + hPadding * 2

    color: Appearance.palette.surfaceContainer

    radius: rounding

    Ripple {
        color: Appearance.palette.surfaceContainerHigh
        onClicked: root.onClicked
        rounding: root.rounding
    }

    Loader {
        id: buttonContent
        anchors.centerIn: parent
        sourceComponent: root.content
    }
}
