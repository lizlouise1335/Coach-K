//
//  Help.swift
//  Written by Liz Smith
//
//  Cases for the following:
//  Volume Button
//  Timer Mode
//  Timer Extra-Display
//  Picker Mode
//
//  Additionally converts seconds to hours, minutes, and seconds

import Foundation


// Volume Button
enum Volume {
    case off
    case on
}

// Timer Running Mode
enum TimerMode {
    case running
    case paused
    case initial
}

// Mode of Work the user is in time wise once clicker is running - Prep, Work, or Rest
enum PickerMode {
    case one //prep
    case two //work
    case three //rest
    
    // for display
    var pickString: String {
        switch self {
        case .one:
            return "Ready?"
        case .two:
            return "Work!"
        case .three:
            return "Rest."
        }
    }
}

// Picker Display Cases (for when setting timer)
enum pickity {
    case work
    case rest
    case prepround
    
    var pickityMode: String {
        switch self {
        case .work:
            return "Work"
        case .rest:
            return "Rest"
        case .prepround:
            return "Prep"
        }
    }
}

// Converts total seconds to hours, minutes, and seconds
func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let hours = "\(seconds / 3600)"
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    
    let hourStamp = hours.count > 1 ? hours : "0" + hours
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(hourStamp) : \(minuteStamp) : \(secondStamp)"
}
