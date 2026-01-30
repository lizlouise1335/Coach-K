//
//  TimerDisplayView.swift
//  TIMOTHY
//
//  Displays the countdown timer and current workout phase

import SwiftUI

struct TimerDisplayView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack(spacing: 16) {
            // Timer countdown display
            Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                .font(.system(size: UIConstants.timerDisplayFontSize, weight: .bold, design: .rounded))
                .padding(.top, UIConstants.topPadding)
                .foregroundColor(UIConstants.accentColor)

            // Current workout phase
            Text(timerManager.workoutState.displayText)
                .font(.title2)
                .foregroundColor(UIConstants.secondaryAccent)

            Spacer()
        }
    }
}

struct TimerDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDisplayView(timerManager: TimerManager())
            .preferredColorScheme(.dark)
    }
}
