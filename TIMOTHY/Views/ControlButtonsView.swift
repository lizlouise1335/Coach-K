//
//  ControlButtonsView.swift
//  TIMOTHY
//
//  Control buttons for timer (play, pause, reset, volume, set)

import SwiftUI

struct ControlButtonsView: View {
    @ObservedObject var timerManager: TimerManager

    let prepDuration: Int
    let workDuration: Int
    let restDuration: Int
    let rounds: Int
    let onSet: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            // VOLUME TOGGLE
            Button {
                timerManager.audioState = timerManager.audioState == .on ? .off : .on
            } label: {
                Image(systemName: timerManager.audioState == .off ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.system(size: 24))
            }
            .foregroundColor(UIConstants.setColor)
            .frame(width: UIConstants.controlButtonSize, height: UIConstants.controlButtonSize)
            .padding(.top, UIConstants.buttonTopPadding)

            // PLAY/PAUSE or SET BUTTON
            if timerManager.timerMode != .initial {
                // PLAY/PAUSE BUTTON
                Button {
                    handlePlayPause()
                } label: {
                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIConstants.playButtonSize, height: UIConstants.playButtonSize)
                }
                .foregroundColor(UIConstants.playColor)

                // RESET BUTTON
                Button {
                    timerManager.reset(prepDuration: prepDuration)
                } label: {
                    Image(systemName: "gobackward")
                        .font(.system(size: 24))
                }
                .foregroundColor(UIConstants.resetColor)
                .frame(width: UIConstants.controlButtonSize, height: UIConstants.controlButtonSize)
                .padding(.top, UIConstants.buttonTopPadding)

            } else {
                // SET BUTTON (when in initial state)
                Button {
                    if isValidConfiguration {
                        onSet()
                    }
                } label: {
                    Image(systemName: "chevron.forward.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIConstants.playButtonSize, height: UIConstants.playButtonSize)
                }
                .foregroundColor(isValidConfiguration ? UIConstants.setColor : .gray)
                .disabled(!isValidConfiguration)
            }
        }
    }

    // MARK: - Helper Methods

    private var isValidConfiguration: Bool {
        workDuration > 0 && restDuration > 0
    }

    private func handlePlayPause() {
        guard isValidConfiguration else { return }

        if timerManager.timerMode == .initial {
            timerManager.setRounds(rounds: rounds)
            timerManager.reset(prepDuration: prepDuration)
        }

        if timerManager.timerMode == .running {
            timerManager.pause()
        } else {
            timerManager.start(
                prepDuration: prepDuration,
                workDuration: workDuration,
                restDuration: restDuration
            )
        }
    }
}

struct ControlButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ControlButtonsView(
                timerManager: TimerManager(),
                prepDuration: 10,
                workDuration: 30,
                restDuration: 15,
                rounds: 8,
                onSet: {}
            )

            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}
