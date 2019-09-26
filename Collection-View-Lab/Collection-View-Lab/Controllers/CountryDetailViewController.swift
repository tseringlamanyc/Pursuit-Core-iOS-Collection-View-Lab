//
//  CountryDetailViewController.swift
//  Collection-View-Lab
//
//  Created by Sunni Tang on 9/26/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        loadImage()
    }

    private func configureLabels() {
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = "\(country.population)"
    }
    
    private func loadImage() {
        ImageHelper.manager.getImage(urlStr: CountryAPIClient.getFlagImageURLStr(from: country.code)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure (let error):
                    print(error)
                case .success (let imageFromOnline):
                    self.imageView.image = imageFromOnline
                }
            }
        }
    }
    
}
