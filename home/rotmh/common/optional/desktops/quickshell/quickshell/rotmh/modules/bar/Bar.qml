import Quickshell
import QtQuick

import qs.config

Scope {
    id: bar

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData
                screen: modelData

                anchors {
                    top: BarConfig.position === BarConfig.Position.Top
                    bottom: BarConfig.position === BarConfig.Position.Bottom
                    left: true
                    right: true
                }

                implicitHeight: BarConfig.height + BarConfig.rounding

                exclusiveZone: BarConfig.height

                color: "transparent"

                Loader {
                    anchors.fill: parent
                    sourceComponent: BarConfig.position === BarConfig.Position.Top ? topBarLayout : bottomBarLayout
                }

                Component {
                    id: topBarLayout

                    Item {
                        BarContent {}
                        BarCorners {}
                    }
                }

                Component {
                    id: bottomBarLayout

                    Item {
                        BarCorners {}
                        BarContent {}
                    }
                }
            }
        }
    }
}
