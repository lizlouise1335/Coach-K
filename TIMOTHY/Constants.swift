//
//  Constants.swift
//  TIMOTHY
//
//  Application-wide constants for configuration and magic values

import Foundation
import SwiftUI
import AVFoundation

// MARK: - Audio Constants

enum AudioConstants {
    /// System sound ID for countdown ticks (3-2-1)
    static let countdownTick: SystemSoundID = 1075

    /// System sound ID for phase completion
    static let phaseComplete: SystemSoundID = 1072

    /// Seconds before phase end to start countdown sound
    static let countdownThreshold = 3
}

// MARK: - Timer Constants

enum TimerConstants {
    /// Default prep time in seconds
    static let defaultPrepSeconds = 10

    /// Default work interval in seconds (30 seconds)
    static let defaultWorkSeconds = 30

    /// Default rest interval in seconds (15 seconds)
    static let defaultRestSeconds = 15

    /// Default number of rounds
    static let defaultRounds = 8

    /// Maximum time value for pickers (0-59)
    static let maxPickerValue = 59

    /// Timer tick interval in seconds
    static let timerInterval = 1.0
}

// MARK: - UI Constants

enum UIConstants {
    // Colors
    static let accentColor = Color.purple
    static let secondaryAccent = Color.pink
    static let playColor = Color.green
    static let resetColor = Color.red
    static let setColor = Color.white

    // Sizes
    static let timerDisplayFontSize: CGFloat = 50
    static let playButtonSize: CGFloat = 130
    static let controlButtonSize: CGFloat = 50
    static let topPadding: CGFloat = 80
    static let buttonTopPadding: CGFloat = 40

    // Animation
    static let standardAnimationDuration = 0.3
}

// MARK: - UserDefaults Keys

enum UserDefaultsKeys {
    static let timerLength = "timerLength"
}
