//
//  WorkoutConfiguration.swift
//  TIMOTHY
//
//  Model representing a complete workout configuration

import Foundation

/// Represents a complete HIIT workout configuration
struct WorkoutConfiguration {
    let prepDuration: Int      // Prep time in seconds
    let workDuration: Int      // Work interval in seconds
    let restDuration: Int      // Rest interval in seconds
    let rounds: Int            // Number of work/rest cycles

    /// Creates a workout configuration with specified durations and rounds
    init(prepDuration: Int, workDuration: Int, restDuration: Int, rounds: Int) {
        self.prepDuration = prepDuration
        self.workDuration = workDuration
        self.restDuration = restDuration
        self.rounds = rounds
    }

    /// Creates a default Tabata-style workout (20s work, 10s rest, 8 rounds, 10s prep)
    static var tabata: WorkoutConfiguration {
        WorkoutConfiguration(
            prepDuration: 10,
            workDuration: 20,
            restDuration: 10,
            rounds: 8
        )
    }

    /// Creates a default EMOM-style workout (45s work, 15s rest, 10 rounds, 10s prep)
    static var emom: WorkoutConfiguration {
        WorkoutConfiguration(
            prepDuration: 10,
            workDuration: 45,
            restDuration: 15,
            rounds: 10
        )
    }

    /// Creates default configuration from constants
    static var `default`: WorkoutConfiguration {
        WorkoutConfiguration(
            prepDuration: TimerConstants.defaultPrepSeconds,
            workDuration: TimerConstants.defaultWorkSeconds,
            restDuration: TimerConstants.defaultRestSeconds,
            rounds: TimerConstants.defaultRounds
        )
    }

    /// Validates that the workout configuration has valid values
    var isValid: Bool {
        workDuration > 0 && restDuration > 0 && rounds > 0
    }

    /// Total workout duration in seconds (excluding prep time)
    var totalDuration: Int {
        (workDuration + restDuration) * rounds
    }

    /// Total duration including prep time
    var totalDurationWithPrep: Int {
        prepDuration + totalDuration
    }
}

// MARK: - Time Picker Helper

/// Helper struct to convert picker indices to time durations
struct TimePickerValues {
    let hours: Int
    let minutes: Int
    let seconds: Int

    /// Total time in seconds
    var totalSeconds: Int {
        hours * 3600 + minutes * 60 + seconds
    }

    init(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}
