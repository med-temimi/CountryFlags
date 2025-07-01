//
//  Country.swift
//  CountryFlags
//
//  Created by Macbook Pro  M'ed on 30/06/25.
//
import Foundation

struct Country: Identifiable, Hashable {
    let id = UUID()
    let code: String
    let name: String
}
