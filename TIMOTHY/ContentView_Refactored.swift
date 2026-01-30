//
//  ContentView_Refactored.swift
//  TIMOTHY
//
//  Refactored main view with extracted components
//
//  TODO:
//  - Add gradient colored progress ring around timer display
//  - Enlarge pickers for better UX
//  - Add display settings (light/dark mode toggle)
//  - Add gradient background
//  - Add finished workout summary display

import SwiftUI

struct ContentView_Refactored: View {
    @ObservedObject var timerManager = TimerManager()

    // Picker state variables
    @State private var prepSeconds = TimerConstants.defaultPrepSeconds
    @State private var workHours = 0
    @State private var workMinutes = 0
    @State private var workSeconds = TimerConstants.defaultWorkSeconds
    @State private var restHours = 0
    @State private var restMinutes = 0
    @State private var restSeconds = TimerConstants.defaultRestSeconds
    @State private var rounds = TimerConstants.defaultRounds

    var body: some View {
        NavigationView {
            VStack {
                // Timer Display (when not in initial state)
                if timerManager.timerMode != .initial {
                    TimerDisplayView(timerManager: timerManager)
                }

                // Workout Configuration Pickers (when in initial state)
                if timerManager.timerMode == .initial {
                    WorkoutPickersView(
                        prepSeconds: $prepSeconds,
                        workHours: $workHours,
                        workMinutes: $workMinutes,
                        workSeconds: $workSeconds,
                        restHours: $restHours,
                        restMinutes: $restMinutes,
                        restSeconds: $restSeconds,
                        rounds: $rounds
                    )
                }

                // Control Buttons
                ControlButtonsView(
                    timerManager: timerManager,
                    prepDuration: prepSeconds,
                    workDuration: workDuration,
                    restDuration: restDuration,
                    rounds: rounds,
                    onSet: handleSetButton
                )
            }
            .accentColor(UIConstants.accentColor)
            .font(.headline)
        }
        .colorScheme(.dark)
    }

    // MARK: - Computed Properties

    private var workDuration: Int {
        workHours * 3600 + workMinutes * 60 + workSeconds
    }

    private var restDuration: Int {
        restHours * 3600 + restMinutes * 60 + restSeconds
    }

    // MARK: - Actions

    private func handleSetButton() {
        timerManager.setRounds(rounds: rounds)
        timerManager.reset(prepDuration: prepSeconds)
        timerManager.timerMode = .paused
    }
}

struct ContentView_Refactored_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Refactored()
    }
}
