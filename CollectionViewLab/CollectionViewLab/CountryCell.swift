//
//  CountryCell.swift
//  CollectionViewLab
//
//  Created by Tsering Lama on 1/14/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import ImageKit

class CountryCell: UICollectionViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capitalText: UILabel!
    @IBOutlet weak var populationText: UILabel!
    
    func loadCell(country: Countries) {
        countryName.text = country.name
        populationText.text = "Population: \(country.population.description)"
        capitalText.text = country.capital ?? "N/A"
        
       // let imageURL1 = "https://www.countryflags.io/\(country.alpha2Code.lowercased())/flat/64.png"
        let imageURL = "https://www.countryflags.io/\(country.alpha2Code)/shiny/64.png"
        
        
        countryImage.getImage(with: imageURL) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.countryImage.image = image
                    
                }
            }
        }
    }
}
