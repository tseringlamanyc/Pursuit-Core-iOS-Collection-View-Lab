//
//  CountryModel.swift
//  CollectionViewLab
//
//  Created by Tsering Lama on 1/14/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

struct Countries: Codable {
    let name: String
    let alpha2Code: String
    let population: Int
    let capital: String?
    let region: String
    let flag: String
}
