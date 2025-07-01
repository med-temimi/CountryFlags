//
//  CountryFlag.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//

import SwiftUI

public struct CountryFlag: View {
    let countryCode: String

    public init(countryCode: String) {
        self.countryCode = countryCode.uppercased()
    }

    private var flagString: String {
        let base: UInt32 = 127397
        var flagString = ""

        for scalar in countryCode.unicodeScalars {
            if let scalarValue = UnicodeScalar(base + scalar.value) {
                flagString.unicodeScalars.append(scalarValue)
            }
        }

        return flagString
    }

    public var body: some View {
        Text(flagString)
            .font(.system(size: 24))
            .accessibilityLabel(Text("Flag of \(countryCode)"))
    }
}
