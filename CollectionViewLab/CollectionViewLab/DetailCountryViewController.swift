//
//  DetailCountryViewController.swift
//  CollectionViewLab
//
//  Created by Tsering Lama on 1/14/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class DetailCountryViewController: UIViewController {
    
    @IBOutlet weak var imagePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    var aCountry: Countries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        name.text = aCountry.name
        population.text = "Population: \(aCountry.population.description)"
        capital.text = aCountry.capital
        
        let imageURL = "https://www.countryflags.io/\(aCountry.alpha2Code)/shiny/64.png"
        
        
        imagePic.getImage(with: imageURL) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imagePic.image = image
                    
                }
            }
        }
    }
}
