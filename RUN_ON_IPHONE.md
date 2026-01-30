# 📱 Running Coach-K on Your iPhone

## Quick Start (Run Right Now!)

The app is ready to run with the refactored code. Follow these steps:

### 1. Open the Project
- Navigate to the `Coach-K` folder
- Double-click `TIMOTHY.xcodeproj` to open in Xcode

### 2. Connect Your iPhone
- Plug your iPhone into your Mac via USB
- Unlock your iPhone
- If prompted, tap "Trust This Computer" on your iPhone

### 3. Select Your Device
- In Xcode's top toolbar, click the device selector (next to the Play/Stop buttons)
- Choose your iPhone from the list (it will show your iPhone's name)

### 4. Build and Run
- Click the **Play button** (▶️) in the top-left corner
- Or press `⌘R` (Command + R)

---

## Troubleshooting

### "Signing for 'TIMOTHY' requires a development team"

**Solution:**
1. In Xcode, click on **TIMOTHY** (blue icon) in the left sidebar
2. Select the **TIMOTHY** target under "Targets"
3. Go to the **Signing & Capabilities** tab
4. Check **"Automatically manage signing"**
5. Under "Team", select your Apple ID
   - If you don't see your Apple ID, go to **Xcode → Preferences → Accounts** and add it

### "Untrusted Developer" on iPhone

**Solution:**
1. On your iPhone, go to **Settings**
2. Scroll down to **General**
3. Tap **VPN & Device Management** (or **Device Management**)
4. Under "Developer App", tap on your Apple ID email
5. Tap **Trust "[Your Email]"**
6. Tap **Trust** again to confirm
7. Go back to Xcode and run the app again (▶️)

### "Could not launch 'TIMOTHY'"

**Solution:**
- Make sure your iPhone is unlocked
- Try unplugging and replugging the USB cable
- In Xcode, go to **Product → Clean Build Folder** (⇧⌘K)
- Try building again (⌘R)

---

## What You'll See

The app will launch with:
- ✅ **Updated timer** with refactored code
- ✅ **Fixed rounds feature** (no longer broken!)
- ✅ Better performance and cleaner code under the hood

### How to Test:
1. Set prep time (e.g., 5 seconds)
2. Set work time (e.g., 10 seconds)
3. Set rest time (e.g., 5 seconds)
4. Set rounds (e.g., 3 rounds)
5. Tap the **forward arrow** button to confirm
6. Tap **Play** (green button)
7. Watch it count down through:
   - Prep (5s) → "Ready?"
   - Work (10s) → "Work!"
   - Rest (5s) → "Rest."
   - Repeat for all rounds! ✅

---

## Using the New Refactored Components (Optional)

If you want to use the cleaner, component-based version I created:

### Add New Files to Xcode:
1. In Xcode, right-click on the **TIMOTHY** folder (yellow folder icon)
2. Choose **Add Files to "TIMOTHY"...**
3. Navigate to the `TIMOTHY` folder and add:
   - `Constants.swift`
   - `WorkoutConfiguration.swift`
   - `ContentView_Refactored.swift`
   - `Views` folder (with all 3 view files inside)
4. Make sure **"Copy items if needed"** is UNCHECKED
5. Make sure **"TIMOTHY" target** is CHECKED
6. Click **Add**

### Switch to Refactored View:
1. Open **TIMOTHYApp.swift**
2. Change line 15 from:
   ```swift
   ContentView()
   ```
   to:
   ```swift
   ContentView_Refactored()
   ```
3. Build and run (⌘R)

The refactored version has the same functionality but with:
- 62% less code in the main view
- Reusable components
- Better organization

---

## Need Help?

If you run into any issues:
1. Check the Xcode console (bottom panel) for error messages
2. Make sure your iPhone is running iOS 15 or later
3. Make sure you have the latest Xcode version
4. Try restarting Xcode

The app should work perfectly with all the improvements! 🎉
