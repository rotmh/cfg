import QtQuick

import qs.config

Rectangle {
    color: "transparent"

    Behavior on color {
        ColorAnimation {
            duration: Appearance.anim.durations.normal

            easing {
                type: Easing.BezierSpline
                bezierCurve: Appearance.anim.curves.standard
            }
        }
    }
}
