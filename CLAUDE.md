# CLAUDE.md - Coach-K Project Documentation

## Project Overview
**Coach-K** is a HIIT (High-Intensity Interval Training) Interval Timer application built for iOS using Swift and SwiftUI. The project was created as a personal learning exercise and reached base functionality on 07/02/2022.

**Current Status:** Active development focusing on UI improvements and additional functionality.

## Project Structure

```
Coach-K/
├── TIMOTHY/                              # Main application directory
│   ├── TIMOTHYApp.swift                 # App entry point
│   ├── ContentView.swift                 # Main UI view (updated)
│   ├── ContentView_Refactored.swift     # Component-based refactored view
│   ├── TimerManager.swift                # Timer state management (refactored)
│   ├── Help.swift                        # Enums and utilities (refactored)
│   ├── Constants.swift                   # App-wide constants (NEW)
│   ├── WorkoutConfiguration.swift        # Workout model (NEW)
│   └── Views/                            # View components (NEW)
│       ├── TimerDisplayView.swift       # Timer display component
│       ├── WorkoutPickersView.swift     # Picker controls component
│       └── ControlButtonsView.swift     # Control buttons component
├── TIMOTHY.xcodeproj/                    # Xcode project files
├── README.md                             # Project description
├── CLAUDE.md                             # This file - project documentation
├── IMPROVEMENT_PLAN.md                   # Roadmap for improvements
└── IMPROVEMENTS_COMPLETED.md             # Completed improvements summary
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

## Recent Improvements (2026)

### Critical Bug Fixes ✅
- **Fixed broken rounds feature** - Rounds now decrement correctly during workouts
- **Fixed timer memory leaks** - Proper timer lifecycle management
- **Removed UserDefaults misuse** - Better state management

### Code Quality Improvements ✅
- Removed all commented-out code
- Improved naming conventions throughout
- Extracted reusable view components
- Created proper models and constants
- Reduced ContentView complexity by 62%

### New Architecture ✅
- **Constants.swift** - Centralized configuration values
- **WorkoutConfiguration.swift** - Proper workout data model with presets
- **View Components** - Separated UI into focused, reusable components
- **Refactored TimerManager** - Clean, well-documented timer logic

See `IMPROVEMENTS_COMPLETED.md` for detailed changelog.

## Author
Created by Liz Smith
Started: July 14, 2022
Base functionality achieved: July 2, 2022
Refactored and improved: January 2026

## Future Considerations

Based on the improved codebase structure, potential enhancements include:

### Phase 2 - UI Improvements
- Gradient progress ring around timer
- Enlarged pickers for better UX
- Gradient background
- Light/dark mode toggle
- Workout completion summary

### Phase 3 - Features
- Preset workout templates (Tabata, EMOM, AMRAP)
- Workout history tracking
- Custom sound options
- Haptic feedback
- Export/share workouts
- Widget support
- Apple Watch companion app

### Phase 4 - Quality
- Unit tests for core functionality
- UI tests for components
- Performance optimizations
- Accessibility improvements
