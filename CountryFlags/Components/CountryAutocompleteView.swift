//
//  CountryAutocompleteView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//
import SwiftUI

struct CountryAutocompleteView: View {
    @State private var searchText = ""

    let allCountries: [Country] = {
        Locale.isoRegionCodes.compactMap { code in
            guard let name = Locale.current.localizedString(forRegionCode: code) else { return nil }
            return Country(code: code, name: name)
        }
        .sorted { $0.name < $1.name }
    }()

    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return allCountries
        } else {
            return allCountries.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.code.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredCountries) { country in
                HStack {
                    CountryFlag(countryCode: country.code)
                    Text(country.name)
                    Spacer()
                    Text(country.code)
                        .foregroundStyle(.secondary)
                }
            }
            .searchable(text: $searchText, prompt: "Search countries")
            .navigationTitle("Countries")
        }
    }
}
