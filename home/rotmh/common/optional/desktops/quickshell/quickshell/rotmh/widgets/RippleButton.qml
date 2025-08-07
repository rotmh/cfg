pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Shapes

import qs.config

Button {
    id: root

    signal pressed(MouseEvent event)

    property bool toggled: false

    property real rounding: Appearance.rounding.small
    property real roundingActive: rounding

    readonly property real currentRadius: root.toggled ? roundingActive : rounding

    property string text

    property var leftClickHandler
    property var middleClickHandler
    property var rightClickHandler

    required property color bgColor
    property color bgHoverColor: bgColor
    property color bgActiveColor: bgColor
    property color bgActiveHoverColor: bgActiveColor
    required property color rippleColor
    property color rippleActiveColor: rippleColor

    property bool enableRipple: true

    property int rippleDuration: 1200

    readonly property color currentBgColor: root.toggled ? (root.hovered ? bgActiveHoverColor : bgActiveColor) : (root.hovered ? bgHoverColor : bgColor)
    readonly property color currnetRippleColor: root.toggled ? rippleActiveColor : rippleColor

    function startRipple(x, y) {
        const stateY = buttonBackground.y;
        rippleAnim.x = x;
        rippleAnim.y = y - stateY;

        const dist = (ox, oy) => ox * ox + oy * oy;
        const stateEndY = stateY + buttonBackground.height;
        rippleAnim.radius = Math.sqrt(Math.max(dist(0, stateY), dist(0, stateEndY), dist(width, stateY), dist(width, stateEndY)));

        rippleFadeAnim.complete();
        rippleAnim.restart();
    }

    component RippleAnim: NumberAnimation {
        duration: root.rippleDuration
        easing.type: Appearance.anim.animations.elementMoveEnter.type
        easing.bezierCurve: Appearance.anim.curves.standardDecel
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onPressed: event => {
            switch (event) {
            case Qt.LeftButton:
                if (root.rightClickHandler)
                    root.rightClickHandler;
                break;
            case Qt.MiddleButton:
                if (root.middleClickHandler)
                    root.middleClickHandler;
                break;
            case Qt.LeftButton:
                if (root.leftClickHandler)
                    root.leftClickHandler;
                break;
            }

            root.down = true;

            if (root.enableRipple)
                root.startRipple(event.x, event.y);
        }

        onReleased: event => {
            root.down = false;

            if (event.button === Qt.LeftButton)
                root.click();

            if (root.enableRipple)
                rippleFadeAnim.restart();
        }

        onCanceled: event => {
            root.down = false;

            if (root.enableRipple)
                rippleFadeAnim.restart();
        }
    }

    RippleAnim {
        id: rippleFadeAnim
        target: ripple
        property: "opacity"
        to: 0
    }

    SequentialAnimation {
        id: rippleAnim

        property real x
        property real y
        property real radius

        PropertyAction {
            target: ripple
            property: "x"
            value: rippleAnim.x
        }
        PropertyAction {
            target: ripple
            property: "y"
            value: rippleAnim.y
        }
        PropertyAction {
            target: ripple
            property: "opacity"
            value: 1
        }
        ParallelAnimation {
            RippleAnim {
                target: ripple
                properties: "implicitWidth,implicitHeight"
                from: 0
                to: rippleAnim.radius * 2
            }
        }
    }

    background: Rectangle {
        id: buttonBackground
        radius: root.buttonEffectiveRadius
        implicitHeight: 50

        color: root.buttonColor
        Behavior on color {
            animation: Appearance.anim.animations.elementMoveFast.colorAnimation.createObject(this)
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: buttonBackground.width
                height: buttonBackground.height
                radius: root.buttonEffectiveRadius
            }
        }

        Item {
            id: ripple
            width: ripple.implicitWidth
            height: ripple.implicitHeight
            opacity: 0
            visible: width > 0 && height > 0

            property real implicitWidth: 0
            property real implicitHeight: 0

            Behavior on opacity {
                animation: Appearance.anim.animations.elementMoveFast.colorAnimation.createObject(this)
            }

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: root.rippleColor
                    }
                    GradientStop {
                        position: 0.3
                        color: root.rippleColor
                    }
                    GradientStop {
                        position: 0.5
                        color: Qt.rgba(root.rippleColor.r, root.rippleColor.g, root.rippleColor.b, 0)
                    }
                }
            }

            transform: Translate {
                x: -ripple.width / 2
                y: -ripple.height / 2
            }
        }
    }

    contentItem: StyledText {
        text: root.text
        color: "#ffffff"
    }
}
