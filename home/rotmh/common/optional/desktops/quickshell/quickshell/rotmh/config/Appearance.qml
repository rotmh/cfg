pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    enum Theme {
        Light,
        Dark
    }

    readonly property var theme: Appearance.Theme.Dark
    readonly property Palette palette: theme === Appearance.Theme.Light ? Colors.baselineLight : Colors.baselineDark
    readonly property Rounding rounding: Rounding {}
    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}
    readonly property Font font: Font {}
    readonly property Anim anim: Anim {}

    component Spacing: QtObject {
        readonly property int small: 7
        readonly property int smaller: 10
        readonly property int normal: 12
        readonly property int larger: 15
        readonly property int large: 20
    }

    component Padding: QtObject {
        readonly property int small: 5
        readonly property int smaller: 7
        readonly property int normal: 10
        readonly property int larger: 12
        readonly property int large: 15
    }

    component Rounding: QtObject {
        readonly property int small: 12
        readonly property int normal: 17
        readonly property int large: 25
        readonly property int full: 1000
    }

    component AnimCurves: QtObject {
        readonly property list<real> standard: [0.2, 0, 0, 1, 1, 1]
        readonly property list<real> standardAccel: [0.3, 0, 1, 1, 1, 1]
        readonly property list<real> standardDecel: [0, 0, 0, 1, 1, 1]
        readonly property list<real> emphasized: [0.05, 0, 2 / 15, 0.06, 1 / 6, 0.4, 5 / 24, 0.82, 0.25, 1, 1, 1]
        readonly property list<real> emphasizedAccel: [0.3, 0, 0.8, 0.15, 1, 1]
        readonly property list<real> emphasizedDecel: [0.05, 0.7, 0.1, 1, 1, 1]

        readonly property list<real> expressiveFastSpatial: [0.42, 1.67, 0.21, 0.9, 1, 1]
        readonly property list<real> expressiveDefaultSpatial: [0.38, 1.21, 0.22, 1, 1, 1]
        readonly property list<real> expressiveEffects: [0.34, 0.8, 0.34, 1, 1, 1]

        readonly property real expressiveFastSpatialDuration: 350
        readonly property real expressiveDefaultSpatialDuration: 500
        readonly property real expressiveSlowSpatialDuration: 650
        readonly property real expressiveEffectsDuration: 200
    }

    component AnimDurations: QtObject {
        readonly property int small: 200
        readonly property int normal: 400
        readonly property int large: 600
        readonly property int extraLarge: 1000
        readonly property int expressiveFastSpatial: 350
        readonly property int expressiveDefaultSpatial: 500
        readonly property int expressiveEffects: 200
    }

    component Anim: QtObject {
        readonly property AnimCurves curves: AnimCurves {}
        readonly property AnimDurations durations: AnimDurations {}

        readonly property QtObject animations: QtObject {
            property QtObject elementMove: QtObject {
                property int duration: root.anim.curves.expressiveDefaultSpatialDuration
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: root.anim.curves.expressiveDefaultSpatial
                property int velocity: 650
                property Component numberAnimation: Component {
                    NumberAnimation {
                        duration: root.anim.animations.elementMove.duration
                        easing.type: root.anim.animations.elementMove.type
                        easing.bezierCurve: root.anim.animation.elementMove.bezierCurve
                    }
                }
                property Component colorAnimation: Component {
                    ColorAnimation {
                        duration: root.anim.animations.elementMove.duration
                        easing.type: root.anim.animations.elementMove.type
                        easing.bezierCurve: root.anim.animations.elementMove.bezierCurve
                    }
                }
            }
            property QtObject elementMoveEnter: QtObject {
                property int duration: 400
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: root.anim.curves.emphasizedDecel
                property int velocity: 650
                property Component numberAnimation: Component {
                    NumberAnimation {
                        duration: root.anim.animations.elementMoveEnter.duration
                        easing.type: root.anim.animations.elementMoveEnter.type
                        easing.bezierCurve: root.anim.animations.elementMoveEnter.bezierCurve
                    }
                }
            }
            property QtObject elementMoveExit: QtObject {
                property int duration: 200
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: animationCurves.emphasizedAccel
                property int velocity: 650
                property Component numberAnimation: Component {
                    NumberAnimation {
                        duration: root.animation.elementMoveExit.duration
                        easing.type: root.animation.elementMoveExit.type
                        easing.bezierCurve: root.animation.elementMoveExit.bezierCurve
                    }
                }
            }
            property QtObject elementMoveFast: QtObject {
                property int duration: animationCurves.expressiveEffectsDuration
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: animationCurves.expressiveEffects
                property int velocity: 850
                property Component colorAnimation: Component {
                    ColorAnimation {
                        duration: root.animation.elementMoveFast.duration
                        easing.type: root.animation.elementMoveFast.type
                        easing.bezierCurve: root.animation.elementMoveFast.bezierCurve
                    }
                }
                property Component numberAnimation: Component {
                    NumberAnimation {
                        duration: root.animation.elementMoveFast.duration
                        easing.type: root.animation.elementMoveFast.type
                        easing.bezierCurve: root.animation.elementMoveFast.bezierCurve
                    }
                }
            }

            property QtObject clickBounce: QtObject {
                property int duration: 200
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: animationCurves.expressiveFastSpatial
                property int velocity: 850
                property Component numberAnimation: Component {
                    NumberAnimation {
                        duration: root.animation.clickBounce.duration
                        easing.type: root.animation.clickBounce.type
                        easing.bezierCurve: root.animation.clickBounce.bezierCurve
                    }
                }
            }
            property QtObject scroll: QtObject {
                property int duration: 400
                property int type: Easing.BezierSpline
                property list<real> bezierCurve: animationCurves.standardDecel
            }
            property QtObject menuDecel: QtObject {
                property int duration: 350
                property int type: Easing.OutExpo
            }
        }
    }

    component FontFamily: QtObject {
        readonly property string sans: "IBM Plex Sans"
        readonly property string mono: "JetBrains Mono NF"
        readonly property string material: "Material Symbols Rounded"
    }

    component FontSize: QtObject {
        readonly property int small: 11
        readonly property int smaller: 12
        readonly property int normal: 13
        readonly property int larger: 15
        readonly property int large: 18
        readonly property int extraLarge: 28
    }

    component Font: QtObject {
        readonly property FontFamily family: FontFamily {}
        readonly property FontSize size: FontSize {}
    }
}
