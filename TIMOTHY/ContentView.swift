//
//
//  ContentView.swift
//  Written by Liz Smith
//
//  Display setup of app. Unfinished.
//
// * add gradient colored progress ring around timer display
// * enlarge pickers
// * add display settings (light/dark mode)
// * gradient background
// * fix audio
// * finished display

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    // Prep picker index
    @State var selectedPickerIndex = 10 //seconds
    // Work picker indices
    @State var selectedPickerIndex8 = 0 // hours
    @State var selectedPickerIndex3 = 0 // minutes
    @State var selectedPickerIndex4 = 5 // seconds
    // Rest picker indices
    @State var selectedPickerIndex9 = 0 // hours
    @State var selectedPickerIndex5 = 0 // mins
    @State var selectedPickerIndex6 = 15 // secs
  
    

    @State var rPick = 0
    
    let availableMinutes = Array(0...59)
        
    
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                
                // *** TIMER TEXT DISPLAY - .paused .running ***
                if timerManager.timerMode != .initial{
                    Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                        .font(.system(size: 50))
                        .padding(.top, 80).foregroundColor(.purple)
                
                    //work, rest, prep
                    Text(timerManager.pickerMode.pickString)
                    Spacer()
                }

                
                // *** PICKERS - Work, Rest, Prep, Rounds - .initial ***
                if timerManager.timerMode == .initial {
                    // PREP
                    Text("Initial Prep:").foregroundColor(.pink)

                    // seconds
                    Picker(selection: $selectedPickerIndex, label: Text("")){
                        ForEach(0 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0]) sec")
                        }
                    }
                
                    // WORK
                    Text("Work:").foregroundColor(.pink)
                    HStack{
                        //hours
                        Picker(selection: $selectedPickerIndex8, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) hr")
                            }
                        }
                        // minutes
                        Picker(selection: $selectedPickerIndex3, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) min")
                            }
                        }
                        //second
                        Picker(selection: $selectedPickerIndex4, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) sec")
                            }
                        }
                    }
                    
                    // REST
                    Text("Rest:").foregroundColor(.pink)
                    HStack{
                        //hours
                        Picker(selection: $selectedPickerIndex9, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) hr")
                            }
                        }
                        //minutes
                        Picker(selection: $selectedPickerIndex5, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) min")
                            }
                        }
                        //seconds
                        Picker(selection: $selectedPickerIndex6, label: Text("")){
                            ForEach(0 ..< availableMinutes.count) {
                                Text("\(self.availableMinutes[$0]) sec")
                            }
                        }
                    }
                    
                    // ROUNDS
                    Text("Rounds").foregroundColor(.pink)
                    
                    Picker(selection: $rPick, label: Text("")){
                        ForEach(1 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0])")
                        }
                    }
                    
                    Spacer()
                   /* TextField("Rounds", text: $rString)
                        .font(.system(size: 20))
                        .keyboardType(.numberPad)
                        .onReceive(Just(self.rString)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.rString = filtered
                                        }
                        }*/
                } //if statement bracket
                
                // *** BOTTOM LINE BUTTONS ****
                HStack{
                    
                    //VOLUME - leave it alone
                    Button{
                        if self.timerManager.volume == .on {
                            self.timerManager.volume = .off
                        } else {
                            self.timerManager.volume = .on
                        }
                     } label: {
                         Image(systemName: timerManager.volume == .off ? "speaker.slash.fill" : "speaker.wave.2.fill")
                     }.foregroundColor(.white)
                      .cornerRadius(20)
                      .frame(width: 50, height: 50)
                      .padding(.top, 40)
                      .aspectRatio(contentMode: .fit)
                    
                    // ** PLAY/PAUSE|SET, RESET|,  - .paused .running **
                    if timerManager.timerMode != .initial { // make if statement and another fucking function please
                        //needs if statement
                        // PLAY/PAUSE appearance
                        Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .foregroundColor(.green)
                            .onTapGesture(perform: { // WHEN BUTTON CLICKED...
                                if selectedPickerIndex3 == 0 && selectedPickerIndex4 == 0 && selectedPickerIndex8 == 0 ||
                                    selectedPickerIndex5 == 0 && selectedPickerIndex6 == 0 && selectedPickerIndex9 == 0{
                                    // stops bad input of all 0s
                                }
                                else {
                                    if self.timerManager.timerMode == .initial {
                                        self.timerManager.setRounds(rnds: self.rPick)  // sets nbr of rounds to rep through intervals
                                        self.timerManager.reset(minu: self.availableMinutes[self.selectedPickerIndex])
                                    }
                                    
                                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start(minute1: self.availableMinutes[self.selectedPickerIndex], minutes2: self.availableMinutes[self.selectedPickerIndex3]*60 + self.availableMinutes[self.selectedPickerIndex4] + self.availableMinutes[self.selectedPickerIndex8]*60*60, minutes3: self.availableMinutes[self.selectedPickerIndex5]*60 + self.availableMinutes[self.selectedPickerIndex6] + self.availableMinutes[self.selectedPickerIndex9]*60*60)
                                }
                            })
                    
                            // RESET BUTTON - red
                            Image(systemName: "gobackward")
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .padding(.top, 40)
                                .onTapGesture(perform: {
                                    self.timerManager.reset(minu: self.availableMinutes[self.selectedPickerIndex])
                                })
                    } else {
                        
                        // SET (IMAGE) - replaces set button
                        Image(systemName: "chevron.forward.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .foregroundColor(.white)
                        .onTapGesture {
                            if selectedPickerIndex3 == 0 && selectedPickerIndex4 == 0 && selectedPickerIndex8 == 0 ||
                                selectedPickerIndex5 == 0 && selectedPickerIndex6 == 0 && selectedPickerIndex9 == 0{
                                // is just here to stop bad input of all 0s
                            }
                            else {
                                self.timerManager.setRounds(rnds: self.rPick)  // sets nbr of rounds to rep through intervals
                                self.timerManager.reset(minu: self.availableMinutes[self.selectedPickerIndex])
                                self.timerManager.timerMode = .paused
                            }
                        }
                        
                        // SET BUTTON
                        /*Button{
                            if selectedPickerIndex3 == 0 && selectedPickerIndex4 == 0 && selectedPickerIndex8 == 0 ||
                                selectedPickerIndex5 == 0 && selectedPickerIndex6 == 0 && selectedPickerIndex9 == 0{
                                // is just here to stop bad input of all 0s
                            }
                            else {
                                self.timerManager.setRounds(rnds: self.rPick)  // sets nbr of rounds to rep through intervals
                                self.timerManager.reset(minu: self.availableMinutes[self.selectedPickerIndex])
                                self.timerManager.timerMode = .paused
                            }
                        } label: {
                            Image(systemName: "chevron.forward.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 130, height: 130)
                                .foregroundColor(.green)
                        }.foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(width: 50, height: 50)
                            .padding(.top, 40)
                            .aspectRatio(contentMode: .fit)
                        */
                        
                        
                    }// closes if statement
                }// closes consistent hstack
                
               
            } //closes big Vstack
            .accentColor(.purple).font(.headline)
            
        }.colorScheme(.dark) // closes navigation view
    } // closes view body
} //closes view struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

