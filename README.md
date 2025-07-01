# CountryFlags

**Zero-Dependency** SwiftUI components to dynamically generate country flags from ISO codes (e.g., "TN" → 🇹🇳). No image assets, no external libraries – just native Swift/SwiftUI.

## 🚀 Key Advantages
- 🏳️ **Instant Flag Generation** - from 2-letter codes
- 🧩 **No Assets Needed** – Flags generated at runtime via Unicode  
- 📦 **No Pods/SPM** – 100% self-contained SwiftUI  
- 🖥 **System-Native** – Matches Apple’s emoji rendering  
- 🎚 **Fully Scalable** – Vector-perfect at any size  
- 📋 **Copy-Paste Friendly** - Ready-to-use components  

---

## Core Implementation

### 1. Unicode Flag Generator
```swift
extension String {
    /// Converts ISO 3166-1 codes to emoji flags ("US" → "🇺🇸")
    func toFlag() -> String {
        guard self.count == 2 else { return "" }
        return self.uppercased()
            .unicodeScalars
            .map { UnicodeScalar(127397 + $0.value)! }
            .reduce("") { $0 + String($1) }
    }
}
```

## Why This Solution Stands Out

| Method           | Storage  | Rendering | Dependencies       |
|------------------|----------|-----------|--------------------|
| **This Solution**| 0KB      | Vector    | None               |
| Image Assets     | ~200KB*  | Bitmap    | None               |
| Flag Libraries   | 1MB+     | Mixed     | SPM/CocoaPods      |

<sup>*Estimated size for 250+ flag PNGs at 2x resolution</sup>

## Requirements

- **iOS 15.0+**
- **Xcode 13+**
- **Swift 5.5+**
