//
//  ContentView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var phoneNumber = ""
    @State private var selectedCountry = Country(code: "TN", name: "Tunisia")
    @State private var selectedCountryCode = "TN"
    @State private var showingCountryPicker = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    // 1. Flag Showcase Section
                    flagShowcaseSection()

                    // 2. Country Picker Section
                    countryPickerSection()

                    // 3. Phone Input Section
                    phoneInputSection()

                    // 4. Autocomplete Section
                    autocompleteSection()
                }
                .padding()
            }
            .navigationTitle("Country Flags")
            .background(Color(.systemGroupedBackground))
        }
    }

    // MARK: - Section Builders

    private func flagShowcaseSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Flag Showcase", icon: "flag.fill")

            HStack {
                ForEach(["TN", "FR", "DE", "JP", "US"], id: \.self) { code in
                    CountryFlagButton(countryCode: code,
                                      isSelected: code == selectedCountryCode,
                                      action: {
                        selectedCountryCode = code
                    })
                }
            }
            .frame(maxWidth: .infinity)
        }
        .sectionContainer()
    }

    private func countryPickerSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Country Picker", icon: "globe")

            Button {
                showingCountryPicker = true
            } label: {
                HStack {
                    CountryFlag(countryCode: selectedCountry.code)
                    Text(selectedCountry.name)
                    Spacer()
                    Text(selectedCountry.code)
                        .foregroundStyle(.secondary)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.tertiary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
        }
        .sectionContainer()
        .sheet(isPresented: $showingCountryPicker) {
            CountryPickerView(selectedCountry: $selectedCountry)
                .presentationDetents([.medium, .large])
        }
    }

    private func phoneInputSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Phone Input", icon: "phone.fill")

            VStack(alignment: .leading, spacing: 8) {
                Text("Phone Number")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack {
                    Button {
                        showingCountryPicker = true
                    } label: {
                        HStack(spacing: 8) {
                            CountryFlag(countryCode: selectedCountry.code)
                            Text("+\(countryCodeToPhonePrefix(selectedCountry.code) ?? "216")")
                                .foregroundStyle(.primary)
                            Image(systemName: "chevron.down")
                                .font(.caption)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.secondary.opacity(0.3), lineWidth: 1)
                        )
                    }

                    TextField("12 345 678", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .textFieldStyle(.roundedBorder)
                }
            }
        }
        .sectionContainer()
    }

    private func autocompleteSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Country Search", icon: "magnifyingglass")

            NavigationLink {
                CountryAutocompleteView()
            } label: {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    Text("Search countries...")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
        }
        .sectionContainer()
    }

    private func countryCodeToPhonePrefix(_ code: String) -> String? {
        switch code {
            case "TN": return "216"
            case "FR": return "33"
            case "DE": return "49"
            case "JP": return "81"
            case "US": return "1"
            default: return nil
        }
    }
}

struct SectionHeader: View {
    let title: String
    let icon: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundStyle(.blue)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    ContentView()
}
