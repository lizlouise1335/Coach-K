# CLAUDE.md - Coach-K Project Documentation

## Project Overview
**Coach-K** is a HIIT (High-Intensity Interval Training) Interval Timer application built for iOS using Swift and SwiftUI. The project was created as a personal learning exercise and reached base functionality on 07/02/2022.

**Current Status:** Active development focusing on UI improvements and additional functionality.

## Project Structure

```
Coach-K/
├── TIMOTHY/                    # Main application directory
│   ├── TIMOTHYApp.swift       # App entry point
│   ├── ContentView.swift      # Main UI view
│   ├── TimerManager.swift     # Timer logic and state management
│   └── Help.swift             # Help/documentation view
├── TIMOTHY.xcodeproj/         # Xcode project files
└── README.md                  # Project description
```

## Key Components

### TIMOTHYApp.swift (TIMOTHY/TIMOTHYApp.swift:10-17)
The main entry point for the SwiftUI application. Initializes the app with ContentView as the root view.

### ContentView.swift (TIMOTHY/ContentView.swift:18-245)
The primary UI view containing:
- Timer display showing remaining time
- Picker controls for:
  - Initial Prep time (seconds)
  - Work intervals (hours, minutes, seconds)
  - Rest intervals (hours, minutes, seconds)
  - Number of rounds
- Control buttons:
  - Play/Pause toggle
  - Reset button
  - Volume on/off toggle
- Timer states: `.initial`, `.running`, `.paused`
- Picker modes: Work, Rest, Prep

### TimerManager.swift
Observable object managing timer state and countdown logic.

## Current Features

1. **Customizable Intervals**
   - Prep time: 0-59 seconds
   - Work time: 0-59 hours, 0-59 minutes, 0-59 seconds
   - Rest time: 0-59 hours, 0-59 minutes, 0-59 seconds
   - Rounds: 1-59

2. **Timer Controls**
   - Start/Pause functionality
   - Reset to initial state
   - Volume toggle (audio feedback)

3. **UI Features**
   - Dark mode interface
   - Purple and pink accent colors
   - Large, visible timer display
   - Intuitive picker interface

## Known TODOs (from ContentView.swift:8-13)

The following improvements are planned:
- [ ] Add gradient colored progress ring around timer display
- [ ] Enlarge pickers for better usability
- [ ] Add display settings (light/dark mode toggle)
- [ ] Implement gradient background
- [ ] Fix audio functionality
- [ ] Complete finished workout display

## Development Notes

### Technical Details
- **Framework:** SwiftUI
- **Language:** Swift
- **Platform:** iOS
- **State Management:** ObservableObject pattern with TimerManager
- **UI Pattern:** Declarative UI with conditional rendering based on timer mode

### Input Validation
The app prevents invalid timer configurations:
- All work or rest intervals cannot be zero
- Validation occurs before allowing timer to start (ContentView.swift:168-169, 200-201)

### Color Scheme
- Background: Dark mode (`.colorScheme(.dark)`)
- Primary accent: Purple
- Secondary accent: Pink
- Controls: Green (play), Red (reset), White (set/volume)

## Building & Running

This is an Xcode project. To build:
1. Open `TIMOTHY.xcodeproj` in Xcode
2. Select target device/simulator
3. Build and run (⌘R)

## Author
Created by Liz Smith
Started: July 14, 2022
Base functionality achieved: July 2, 2022

## Future Considerations

Based on the codebase structure, potential enhancements could include:
- Preset workout templates
- Workout history tracking
- Custom sound options
- Haptic feedback
- Widget support
- Apple Watch companion app
