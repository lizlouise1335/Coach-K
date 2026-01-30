//
//  TimerManager.swift
//  Written by Liz Smith
//
//  Manages timer state and countdown functionality for HIIT workouts

import Foundation
import SwiftUI
import AVFoundation

class TimerManager: ObservableObject {

    // MARK: - Published Properties

    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft: Int = 0
    @Published var workoutState: WorkoutState = .prep
    @Published var audioState: AudioState = .off
    @Published var remainingRounds: Int = 0

    // MARK: - Private Properties

    private var timer: Timer?
    private var configuration: WorkoutConfiguration?

    // MARK: - Configuration

    /// Sets up the workout with given configuration
    func configure(with workout: WorkoutConfiguration) {
        configuration = workout
        remainingRounds = workout.rounds
        secondsLeft = workout.prepDuration
        workoutState = .prep
        timerMode = .initial
    }

    /// Legacy support for setting rounds
    func setRounds(rounds: Int) {
        remainingRounds = rounds
    }

    // MARK: - Timer Control

    /// Starts or resumes the timer with given durations
    func start(prepDuration: Int, workDuration: Int, restDuration: Int) {
        // Invalidate existing timer to prevent multiple timers running
        timer?.invalidate()

        timerMode = .running

        timer = Timer.scheduledTimer(withTimeInterval: TimerConstants.timerInterval, repeats: true) { [weak self] _ in
            self?.tick(prepDuration: prepDuration, workDuration: workDuration, restDuration: restDuration)
        }
    }

    /// Pauses the timer
    func pause() {
        timerMode = .paused
        timer?.invalidate()
        timer = nil
    }

    /// Resets the timer to initial state
    func reset(prepDuration: Int) {
        timer?.invalidate()
        timer = nil
        workoutState = .prep
        timerMode = .initial
        secondsLeft = prepDuration

        // Reset rounds to configured value
        if let config = configuration {
            remainingRounds = config.rounds
        }
    }

    // MARK: - Private Timer Logic

    private func tick(prepDuration: Int, workDuration: Int, restDuration: Int) {
        // Handle phase transitions when timer reaches zero
        if secondsLeft == 0 {
            handlePhaseTransition(prepDuration: prepDuration, workDuration: workDuration, restDuration: restDuration)
            return
        }

        // Countdown
        secondsLeft -= 1

        // Play audio feedback if enabled
        playAudioFeedback()
    }

    private func handlePhaseTransition(prepDuration: Int, workDuration: Int, restDuration: Int) {
        switch workoutState {
        case .prep:
            // Transition from prep to work
            workoutState = .work
            secondsLeft = workDuration

        case .work:
            // Transition from work to rest
            workoutState = .rest
            secondsLeft = restDuration

        case .rest:
            // Decrement rounds and either repeat or finish
            remainingRounds -= 1

            if remainingRounds > 0 {
                // More rounds remaining - go back to work
                workoutState = .work
                secondsLeft = workDuration
            } else {
                // Workout complete - reset to initial state
                reset(prepDuration: prepDuration)
            }
        }
    }

    private func playAudioFeedback() {
        guard audioState == .on else { return }

        // Play countdown ticks in final seconds
        if secondsLeft <= AudioConstants.countdownThreshold && secondsLeft > 0 {
            AudioServicesPlaySystemSound(AudioConstants.countdownTick)
        }
        // Play completion sound at zero
        else if secondsLeft == 0 {
            AudioServicesPlaySystemSound(AudioConstants.phaseComplete)
        }
    }
}

