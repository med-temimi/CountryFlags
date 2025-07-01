//
//  CountryFlagButton.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//

import SwiftUI

struct CountryFlagButton: View {
    let countryCode: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            CountryFlag(countryCode: countryCode)
                .frame(width: 44, height: 44)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? .green : .secondary.opacity(0.2), lineWidth: isSelected ? 2 : 1)
                )
                .scaleEffect(isSelected ? 1.05 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}
