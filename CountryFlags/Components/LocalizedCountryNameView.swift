//
//  LocalizedCountryNameView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 28/07/25.
//


import SwiftUI

struct LocalizedCountryNameView: View {
    let countryCode: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Localized Country Name", icon: "character.book.closed.fill")

            Text(countryCode.localizedCountryName)
                .font(.title2.weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
    }
}
