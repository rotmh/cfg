import QtQuick

// A Material Design color palette
QtObject {
    // -- Primary colors --

    // Main color used across screens and components
    required property color primary
    // Text and icons shown against the primary color
    required property color onPrimary_
    // Standout container color for key components
    required property color primaryContainer
    // Contrast-passing color shown against the primary container
    required property color onPrimaryContainer_

    // -- Secondary colors --

    // Accent color used across screens and components
    required property color secondary
    // Text and icons shown against the secondary color
    required property color onSecondary_
    // Less prominent container color, for components like tonal buttons
    required property color secondaryContainer
    // Contrast-passing color shown against the secondary container
    required property color onSecondaryContainer_

    // -- Tertiary colors --

    // Contrasting accent color used across screens and components
    required property color tertiary
    // Text and icons shown against the tertiary color
    required property color onTertiary_
    // Contrasting container color, for components like input fields
    required property color tertiaryContainer
    // Contrast-passing color shown against the tertiary container
    required property color onTertiaryContainer_

    // -- Error colors --

    // Indicates errors, such as invalid input in a date picker
    required property color error
    // Used for text and icons on the error color
    required property color onError_
    // Container color for error messages and badges
    required property color errorContainer
    // Used for text and icons on the error-container color
    required property color onErrorContainer_

    // -- Surface colors --

    // Surface color for components like cards, sheets, and menus
    required property color surface
    // Text and icons shown against the surface color
    required property color onSurface_
    // Alternate surface color, can be used for active states
    required property color surfaceVariant
    // For text and icons to indicate active or inactive component state
    required property color onSurfaceVariant_

    required property color surfaceContainerHighest
    required property color surfaceContainerHigh
    required property color surfaceContainer
    required property color surfaceContainerLow
    required property color surfaceContainerLowest

    // Displays opposite color of the surrounding UI
    required property color inverseSurface
    // Used for text and icons shown against the inverse surface color
    required property color inverseOnSurface

    // -- Outline colors --

    // Subtle color used for boundaries
    required property color outline
    // Outline-variant is used to define the border of a component where 3:1
    // contrast ratio isn’t required, a container, or a divider.
    required property color outlineVariant
}
