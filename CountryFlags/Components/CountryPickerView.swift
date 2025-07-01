//
//  CountryPickerView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//

import SwiftUI

struct CountryPickerView: View {
    @Binding var selectedCountry: Country
    @Environment(\.dismiss) private var dismiss

    let countries: [Country] = {
        Locale.isoRegionCodes.compactMap { code in
            guard let name = Locale.current.localizedString(forRegionCode: code) else { return nil }
            return Country(code: code, name: name)
        }
        .sorted { $0.name < $1.name }
    }()

    var body: some View {
        NavigationStack {
            List(countries) { country in
                Button {
                    selectedCountry = country
                    dismiss()
                } label: {
                    HStack {
                        CountryFlag(countryCode: country.code)
                        Text(country.name)
                        Spacer()
                        if selectedCountry.code == country.code {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("Select Country")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .searchable(text: .constant(""), prompt: "Search countries")
        }
    }
}
