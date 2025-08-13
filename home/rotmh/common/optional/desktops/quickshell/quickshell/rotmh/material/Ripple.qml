import QtQuick
import QtQuick.Shapes

import qs.config

// Adds ripple effect to it's parent.
//
// Should be the first child (so it won't render over siblings).
//
// There must not be siblings which also capture mouse events (as they will
// prevent this element from receiving the mouse events and thus a ripple will
// not be rendered), unless the other sibling propagates the event properly
// (see https://doc.qt.io/qt-6/qml-qtquick-mousearea.html#propagateComposedEvents-prop).
// Note: you can set the Ripple's `onClicked` handler (but not other handlers).
MouseArea {
    id: root

    required property color color
    property int radius: 0

    anchors.fill: parent
    clip: true

    property bool down: false

    onPressed: event => {
        root.down = true;
        startRipple(event.x, event.y);
    }

    onReleased: event => {
        root.down = false;
        fadeAnim.restart();
    }

    onCanceled: () => {
        root.down = false;
        fadeAnim.restart();
    }

    readonly property int easingType: Easing.BezierSpline
    readonly property list<real> easingBezierCurve: Appearance.anim.curves.standard

    readonly property int growDuration: 800
    readonly property int fadeDuration: 1400

    // Computes the minimal radius required for
    // the ripple to cover the entire parent.
    function rippleRadius(x, y) {
        const parentWidth = root.width;
        const parentHeight = root.height;

        const parentStartX = root.x;
        const parentEndX = parentStartX + parentWidth;

        const parentStartY = root.y;
        const parentEndY = parentStartY + parentHeight;

        console.log(`parentWidth: ${parentWidth}, parentHeight: ${parentHeight}, parentStartX: ${parentStartX}, parentEndX: ${parentEndX}, parentStartY: ${parentStartY}, parentEndY: ${parentEndY}`);

        return Math.max(parentEndX - x, x - parentStartX, parentEndY - y, y - parentStartY);
    }

    function startRipple(x, y) {
        const radius = Math.max(root.width, root.height) * 5;
        // const radius = rippleRadius(x, y) * 4;

        fadeAnim.complete();

        growAnim.radius = radius;
        ripple.opacity = 1;
        ripple.centerX = x;
        ripple.centerY = y;

        growAnim.restart();
    }

    NumberAnimation {
        id: fadeAnim

        target: ripple
        property: "opacity"

        to: 0

        duration: root.fadeDuration
        easing.type: root.easingType
        easing.bezierCurve: root.easingBezierCurve
    }

    NumberAnimation {
        id: growAnim

        property real radius

        target: ripple
        property: "radius"

        from: 0
        to: radius

        duration: root.growDuration
        easing.type: root.easingType
        easing.bezierCurve: root.easingBezierCurve
    }

    Shape {
        id: ripple

        property real radius: 0
        property real centerX
        property real centerY

        anchors.fill: parent
        visible: 0 < radius
        opacity: 0

        ShapePath {
            strokeWidth: 0
            // fillColor: "transparent"

            fillGradient: RadialGradient {
                centerX: ripple.centerX
                centerY: ripple.centerY
                centerRadius: ripple.radius
                focalX: ripple.centerX
                focalY: ripple.centerY
                focalRadius: 0

                GradientStop {
                    position: 0.0
                    color: root.color
                }
                GradientStop {
                    position: 0.3
                    color: root.color
                }
                GradientStop {
                    position: 0.5
                    color: Qt.rgba(root.color.r, root.color.g, root.color.b, 0)
                }
            }

            PathRectangle {
                x: 0
                y: 0
                width: ripple.width
                height: ripple.height
                radius: root.radius
            }
        }
    }
}

