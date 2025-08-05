pragma Singleton

import Quickshell
import QtQuick

import qs.config

Singleton {
    enum Position { Top, Bottom } // Left, Right ?

    readonly property var position: BarConfig.Position.Top

    readonly property int height: 40
    readonly property int rounding: 10

    readonly property color bgColor: Appearance.palette.surface
}
