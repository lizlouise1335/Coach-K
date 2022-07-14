//
//  TimerManager.swift
//  Written by Liz Smith
//
//  Includes button functionality and timer countdown functionality.
//

import Foundation
import SwiftUI
import AVFoundation
class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    @Published var pickerMode: PickerMode = .one
    @Published var volume: Volume = .off
    @Published var rounds = 0
    @Published var mode: pickity = .work
    
    var timer = Timer()
    
    // SET TIMER LENGTH
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
        
    }
    
    // SET INITIAL ROUND NBR
    func setRounds(rnds: Int){
        self.rounds = rnds
    }
    
    // START FUNCTIONALITY
    func start(minute1: Int, minutes2: Int, minutes3: Int) {
        var tea = self.rounds // set number of rounds through the time intervals
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            
            if self.secondsLeft == 0 && self.pickerMode == .one {
                self.setTimerLength(minutes: minutes2)
                self.pickerMode = .two

            } else if self.secondsLeft == 0 && self.pickerMode == .two {
                self.setTimerLength(minutes: minutes3)
                self.pickerMode = .three

            } else if self.secondsLeft == 0 && self.pickerMode == .three {
                tea -= 1
                
                if tea > 0 {
                    self.setTimerLength(minutes: minutes2)
                    self.pickerMode = .two
                } else {
                    self.pickerMode = .one
                    self.reset(minu: minute1)
                }
            } else {
                self.timerMode = .running
                self.secondsLeft -= 1
                if self.volume == .on {
                    if self.secondsLeft < 4 && self.secondsLeft > 0{
                        AudioServicesPlaySystemSound(1075) // 1075, fun audio stuff
                    } else if self.secondsLeft == 0{
                        AudioServicesPlaySystemSound(1072) // 1072, fun audio stuff
                    }
                }
            }
        })
    }
    
    // RESET BUTTON FUNCTIONALITY
    func reset(minu: Int) {
        self.pickerMode = .one
        self.timerMode = .initial
        self.setTimerLength(minutes: minu)
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength") // changed to a reset time
        timer.invalidate()
    }
    
    
    //PAUSE MODE FUNCTIONALITY
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    
}
