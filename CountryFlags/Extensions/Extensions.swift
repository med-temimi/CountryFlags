//
//  Extensions.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//

import SwiftUI

extension View {
    func sectionContainer() -> some View {
        self
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

extension String {
    var toFlag: String {
        self.uppercased().unicodeScalars
            .compactMap { UnicodeScalar(127397 + $0.value) }
            .reduce("") { $0 + String($1) }
    }

    var localizedCountryName: String {
        Locale.current.localizedString(forRegionCode: self.uppercased()) ?? self
    }

    // Display currency based on location language ...
//    var currencySymbol: String? {
//        let localeId = Locale.availableIdentifiers.first {
//            Locale(identifier: $0).regionCode == self.uppercased()
//        }
//        guard let localeId else { return nil }
//        return Locale(identifier: localeId).currencySymbol
//    }

    var currencySymbol: String? {
        let regionCode = self.uppercased()
        if let matchedLocaleID = Locale.availableIdentifiers.first(where: {
            Locale(identifier: $0).regionCode == regionCode
        }) {
            let locale = Locale(identifier: matchedLocaleID)
            let currencyCode = locale.currencyCode ?? "N/A"
            let englishLocale = Locale(identifier: "en_US") // Force English representation
            return englishLocale.localizedString(forCurrencyCode: currencyCode)
        }
        return nil
    }

    var currencyCode: String? {
        let regionCode = self.uppercased()
        if let matchedLocaleID = Locale.availableIdentifiers.first(where: {
            Locale(identifier: $0).regionCode == regionCode
        }) {
            return Locale(identifier: matchedLocaleID).currencyCode
        }
        return nil
    }

    var callingCode: String? {
        PhoneCodeManager.shared.phoneCode(for: self)
    }
}
