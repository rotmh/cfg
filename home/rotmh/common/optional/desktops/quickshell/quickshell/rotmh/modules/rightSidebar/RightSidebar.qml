import QtQuick
import Quickshell

import qs
import qs.config

Scope {
    PanelWindow {
        visible: GlobalState.rightSidebarOpen

        exclusiveZone: 0

        implicitWidth: RightSidebarConfig.width

        // color: "transparent"

        anchors {
            top: true
            bottom: true
            right: true
        }

        Loader {
            anchors {
                fill: parent
                margins: 4
            }

            active: GlobalState.rightSidebarOpen
            focus: GlobalState.rightSidebarOpen

            Keys.onPressed: event => {
                if (event.key === Qt.Key_Escape) {
                    GlobalState.rightSidebarOpen = false
                }
            }

            sourceComponent: RightSidebarContent {}
        }
    }
}
