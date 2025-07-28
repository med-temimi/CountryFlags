//
//  CallingCodeView.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 28/07/25.
//


import SwiftUI

struct CallingCodeView: View {
    let countryCode: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Calling Code", icon: "phone.connection")

            Text(countryCode.callingCode ?? "Not found")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .sectionContainer()
    }
}
