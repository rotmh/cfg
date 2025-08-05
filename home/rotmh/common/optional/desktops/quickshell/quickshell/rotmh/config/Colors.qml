pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property Palette baselineLight: Palette {
        readonly property color primary: "#6750A4"
        readonly property color onPrimary_: "#FFFFFF"
        readonly property color primaryContainer: "#EADDFF"
        readonly property color onPrimaryContainer_: "#4F378B"

        readonly property color secondary: "#625B71"
        readonly property color onSecondary_: "#FFFFFF"
        readonly property color secondaryContainer: "#E8DEF8"
        readonly property color onSecondaryContainer_: "#4A4458"

        readonly property color tertiary: "#7D5260"
        readonly property color onTertiary_: "#FFFFFF"
        readonly property color tertiaryContainer: "#FFD8E4"
        readonly property color onTertiaryContainer_: "#633B48"

        readonly property color error: "#B3261E"
        readonly property color onError_: "#FFFFFF"
        readonly property color errorContainer: "#F9DEDC"
        readonly property color onErrorContainer_: "#8C1D18"

        readonly property color surface: "#FEF7FF"
        readonly property color onSurface_: "#1D1B20"
        readonly property color surfaceVariant: "#E7E0EC"
        readonly property color onSurfaceVariant_: "#49454F"

        readonly property color surfaceContainerHighest: "#E6E0E9"
        readonly property color surfaceContainerHigh: "#ECE6F0"
        readonly property color surfaceContainer: "#F3EDF7"
        readonly property color surfaceContainerLow: "#F7F2FA"
        readonly property color surfaceContainerLowest: "#FFFFFF"

        readonly property color inverseSurface: "#322F35"
        readonly property color inverseOnSurface: "#F5EFF7"

        readonly property color outline: "#79747E"
        readonly property color outlineVariant: "#CAC4D0"
    }

    readonly property Palette baselineDark: Palette {
        readonly property color primary: "#D0BCFF"
        readonly property color onPrimary_: "#381E72"
        readonly property color primaryContainer: "#4F378B"
        readonly property color onPrimaryContainer_: "#EADDFF"

        readonly property color secondary: "#CCC2DC"
        readonly property color onSecondary_: "#332D41"
        readonly property color secondaryContainer: "#4A4458"
        readonly property color onSecondaryContainer_: "#E8DEF8"

        readonly property color tertiary: "#EFB8C8"
        readonly property color onTertiary_: "#492532"
        readonly property color tertiaryContainer: "#633B48"
        readonly property color onTertiaryContainer_: "#FFD8E4"

        readonly property color error: "#F2B8B5"
        readonly property color onError_: "#601410"
        readonly property color errorContainer: "#8C1D18"
        readonly property color onErrorContainer_: "#F9DEDC"

        readonly property color surface: "#141218"
        readonly property color onSurface_: "#E6E0E9"
        readonly property color surfaceVariant: "#49454F"
        readonly property color onSurfaceVariant_: "#CAC4D0"

        readonly property color surfaceContainerHighest: "#36343B"
        readonly property color surfaceContainerHigh: "#2B2930"
        readonly property color surfaceContainer: "#211F26"
        readonly property color surfaceContainerLow: "#1D1B20"
        readonly property color surfaceContainerLowest: "#0F0D13"

        readonly property color inverseSurface: "#E6E0E9"
        readonly property color inverseOnSurface: "#322F35"

        readonly property color outline: "#938F99"
        readonly property color outlineVariant: "#49454F"
    }
}
