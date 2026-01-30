//
//  WorkoutPickersView.swift
//  TIMOTHY
//
//  Picker controls for configuring workout intervals

import SwiftUI

struct WorkoutPickersView: View {
    @Binding var prepSeconds: Int
    @Binding var workHours: Int
    @Binding var workMinutes: Int
    @Binding var workSeconds: Int
    @Binding var restHours: Int
    @Binding var restMinutes: Int
    @Binding var restSeconds: Int
    @Binding var rounds: Int

    let availableValues = Array(0...TimerConstants.maxPickerValue)

    var body: some View {
        VStack(spacing: 20) {
            // PREP TIME
            VStack {
                Text("Initial Prep:")
                    .foregroundColor(UIConstants.secondaryAccent)
                    .font(.headline)

                Picker(selection: $prepSeconds, label: Text("")) {
                    ForEach(0 ..< availableValues.count) {
                        Text("\(availableValues[$0]) sec")
                    }
                }
                .pickerStyle(.wheel)
            }

            // WORK INTERVAL
            VStack {
                Text("Work:")
                    .foregroundColor(UIConstants.secondaryAccent)
                    .font(.headline)

                HStack {
                    Picker(selection: $workHours, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) hr")
                        }
                    }

                    Picker(selection: $workMinutes, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) min")
                        }
                    }

                    Picker(selection: $workSeconds, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) sec")
                        }
                    }
                }
            }

            // REST INTERVAL
            VStack {
                Text("Rest:")
                    .foregroundColor(UIConstants.secondaryAccent)
                    .font(.headline)

                HStack {
                    Picker(selection: $restHours, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) hr")
                        }
                    }

                    Picker(selection: $restMinutes, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) min")
                        }
                    }

                    Picker(selection: $restSeconds, label: Text("")) {
                        ForEach(0 ..< availableValues.count) {
                            Text("\(availableValues[$0]) sec")
                        }
                    }
                }
            }

            // ROUNDS
            VStack {
                Text("Rounds")
                    .foregroundColor(UIConstants.secondaryAccent)
                    .font(.headline)

                Picker(selection: $rounds, label: Text("")) {
                    ForEach(1 ..< availableValues.count) {
                        Text("\(availableValues[$0])")
                    }
                }
                .pickerStyle(.wheel)
            }

            Spacer()
        }
    }
}

struct WorkoutPickersView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPickersView(
            prepSeconds: .constant(10),
            workHours: .constant(0),
            workMinutes: .constant(0),
            workSeconds: .constant(30),
            restHours: .constant(0),
            restMinutes: .constant(0),
            restSeconds: .constant(15),
            rounds: .constant(8)
        )
        .preferredColorScheme(.dark)
    }
}
