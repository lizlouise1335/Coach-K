//
//  Help.swift
//  Written by Liz Smith
//
//  Enums and helper functions for:
//  - Audio settings
//  - Timer states
//  - Workout phases
//  - Time formatting utilities

import Foundation

// MARK: - Audio Settings

enum AudioState {
    case off
    case on
}

// MARK: - Timer States

enum TimerMode {
    case running
    case paused
    case initial
}

// MARK: - Workout Phases

/// Represents the current phase of the workout (prep, work, or rest)
enum WorkoutState {
    case prep
    case work
    case rest

    var displayText: String {
        switch self {
        case .prep:
            return "Ready?"
        case .work:
            return "Work!"
        case .rest:
            return "Rest."
        }
    }
}

// MARK: - Time Formatting

/// Converts total seconds to formatted time string (HH:MM:SS)
func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let secs = (seconds % 3600) % 60

    let hourString = String(format: "%02d", hours)
    let minuteString = String(format: "%02d", minutes)
    let secondString = String(format: "%02d", secs)

    return "\(hourString) : \(minuteString) : \(secondString)"
}
