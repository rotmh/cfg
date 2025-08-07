import QtQuick

Item {
    id: root

    enum Corner { TopLeft, TopRight, BottomLeft, BottomRight }

    required property var corner

    required property int size
    required property color color

    implicitHeight: size
    implicitWidth: size

    Canvas {
        id: canvas

        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            var r = root.size;
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.beginPath();
            switch (root.corner) {
                case RoundCorner.Corner.TopLeft:
                    ctx.arc(r, r, r, Math.PI, 3 * Math.PI / 2);
                    ctx.lineTo(0, 0);
                    break;
                case RoundCorner.Corner.TopRight:
                    ctx.arc(0, r, r, 3 * Math.PI / 2, 2 * Math.PI);
                    ctx.lineTo(r, 0);
                    break;
                case RoundCorner.Corner.BottomLeft:
                    ctx.arc(r, 0, r, Math.PI / 2, Math.PI);
                    ctx.lineTo(0, r);
                    break;
                case RoundCorner.Corner.BottomRight:
                    ctx.arc(0, 0, r, 0, Math.PI / 2);
                    ctx.lineTo(r, r);
                    break;
            }
            ctx.closePath();
            ctx.fillStyle = root.color;
            ctx.fill();
        }
    }
}
