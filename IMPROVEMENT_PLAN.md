# Coach-K Improvement Plan

## Critical Bugs to Fix

### 1. **BROKEN ROUNDS FEATURE** 🔴
**Location:** `TimerManager.swift:38`
**Issue:** The `tea` variable is local to the timer closure and resets every tick. Rounds will never decrement properly.
**Fix:** Move `remainingRounds` to be a `@Published` property of TimerManager.

### 2. **Timer State Leak**
**Issue:** Timer instance isn't properly invalidated, causing potential memory leaks
**Fix:** Invalidate timer before creating new instances

## Code Cleanup

### Remove Unused Code:
- ❌ Lines 129-137 in ContentView.swift (commented TextField)
- ❌ Lines 212-233 in ContentView.swift (commented SET button)
- ❌ Line 18 in TimerManager.swift (`mode: pickity`)

### Rename for Clarity:
- `pickity` → `WorkoutPhase`
- `PickerMode` → `WorkoutState`
- `pickString` → `displayText`
- `pickityMode` → `displayName`
- `tea` → `remainingRounds`
- `minu` → `prepSeconds`
- `minute1/2/3` → `prepDuration`, `workDuration`, `restDuration`

## Refactoring Tasks

### 1. Create Proper Models
```swift
struct WorkoutConfiguration {
    let prepDuration: Int
    let workDuration: Int
    let restDuration: Int
    let rounds: Int

    var isValid: Bool {
        workDuration > 0 && restDuration > 0
    }
}
```

### 2. Extract View Components
- `TimerDisplayView` - shows time and state
- `WorkoutPickersView` - all picker controls
- `ControlButtonsView` - play, pause, reset, volume

### 3. Simplify TimerManager
- Remove UserDefaults for temporary state
- Use proper state machine pattern
- Add constants for audio system sounds
- Better timer lifecycle management

### 4. Improve ContentView
- Extract validation logic to model
- Use computed properties for UI state
- Reduce from 253 lines to ~100 lines

## Code Quality Improvements

### Constants File
Create `Constants.swift` for:
- Audio system sound IDs
- Default timer values
- UI color scheme
- Animation durations

### Helper Extensions
- TimeInterval extension for formatting
- View extensions for common modifiers

## Feature Improvements

### Phase 1 - Code Quality (Current)
- [x] Fix rounds bug
- [ ] Remove unused code
- [ ] Rename unclear variables
- [ ] Extract view components
- [ ] Create proper models
- [ ] Add constants

### Phase 2 - UI Improvements
- [ ] Gradient progress ring around timer
- [ ] Enlarge pickers for better UX
- [ ] Gradient background
- [ ] Better typography and spacing
- [ ] Animations for state transitions

### Phase 3 - Features
- [ ] Workout presets (Tabata, EMOM, AMRAP)
- [ ] Workout history/statistics
- [ ] Custom sounds/haptics
- [ ] Light/dark mode toggle
- [ ] Export/share workouts
- [ ] Apple Watch support

## Architecture Improvements

### Current Structure Issues:
1. No separation of concerns
2. Business logic mixed with UI
3. No proper dependency injection
4. Hard to test

### Proposed Structure:
```
Models/
  - WorkoutConfiguration.swift
  - WorkoutSession.swift

ViewModels/
  - TimerViewModel.swift (refactored TimerManager)

Views/
  - ContentView.swift (orchestrator)
  - TimerDisplayView.swift
  - WorkoutPickersView.swift
  - ControlButtonsView.swift

Utilities/
  - Constants.swift
  - Extensions.swift
  - SoundManager.swift
```

## Testing Strategy

### Unit Tests Needed:
- WorkoutConfiguration validation
- Timer state transitions
- Time formatting helpers

### UI Tests Needed:
- Timer countdown accuracy
- Round progression
- Button state changes

## Performance Considerations

1. **Timer Accuracy:** Use `DispatchSourceTimer` instead of `Timer` for better accuracy
2. **State Updates:** Minimize published property changes
3. **View Updates:** Use `@ViewBuilder` for conditional content

## Accessibility Improvements

- Add VoiceOver labels
- Dynamic Type support
- Reduce motion support
- High contrast mode support

## Next Steps

1. ✅ Fix critical rounds bug
2. Remove unused code
3. Refactor enums and naming
4. Extract view components
5. Create models and constants
6. Improve TimerManager architecture
7. Add documentation
8. Commit changes with detailed messages
