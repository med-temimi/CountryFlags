//
//  CurrencySymbolView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 28/07/25.
//


import SwiftUI

struct CurrencySymbolView: View {
    let countryCode: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Currency Symbol", icon: "dollarsign.circle.fill")

            Text(countryCode.currencySymbol ?? "N/A")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
    }
}
