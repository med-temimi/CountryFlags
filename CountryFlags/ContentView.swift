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
                    flagShowcaseSection()
                    countryPickerSection()
                    phoneInputSection()
                    autocompleteSection()
                    localizedCountryNameSection()
                    currencySymbolSection()
                    callingCodeSection()
                }
                .padding()
            }
            .navigationTitle("Country Flags Pro")
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private func flagShowcaseSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Flag Showcase", icon: "flag.fill")
            
            HStack {
                ForEach(["TN", "FR", "DE", "JP", "US"], id: \ .self) { code in
                    CountryFlagButton(countryCode: code, isSelected: code == selectedCountryCode) {
                        selectedCountryCode = code
                    }
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
                            Text("\(selectedCountry.code.callingCode ?? "---")")
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
    
    private func localizedCountryNameSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Localized Country Name", icon: "character.book.closed.fill")
            
            Text(selectedCountry.code.localizedCountryName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
    }
    
    private func currencySymbolSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Currency Symbol", icon: "dollarsign.circle.fill")
            
            let symbol = selectedCountry.code.currencySymbol ?? "N/A"
            let code = selectedCountry.code.currencyCode ?? ""
            
            Text("\(symbol) \(code.isEmpty ? "" : "(\(code))")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
    }
    
    private func callingCodeSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Calling Code", icon: "phone.connection")
            
            Text(selectedCountry.code.callingCode ?? "Not found")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
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
