//
//  PhoneCodeManager.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 28/07/25.
//


import Foundation

class PhoneCodeManager {
    static let shared = PhoneCodeManager()
    
    private var codes: [String: String] = [:]

    private init() {
        loadCodes()
    }

    private func loadCodes() {
        guard let url = Bundle.main.url(forResource: "countries_codes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([String: String].self, from: data) else {
            print("❌ Failed to load countries_codes.json")
            return
        }
        self.codes = decoded
    }

    func phoneCode(for countryCode: String) -> String? {
        return codes[countryCode.uppercased()]
    }
}
