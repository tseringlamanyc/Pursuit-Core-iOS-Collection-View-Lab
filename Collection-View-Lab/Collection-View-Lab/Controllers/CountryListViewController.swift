//
//  ViewController.swift
//  Collection-View-Lab
//
//  Created by Sunni Tang on 9/26/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    var countries = [Country]() {
        didSet {
            countryCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        loadData()
    }

    private func configureCollectionView() {
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
    }

    private func loadData() {
        CountryAPIClient.manager.getCountries { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let dataFromOnline):
                    self.countries = dataFromOnline
                }
            }
        }
    }
}

extension CountryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath)
        
        return countryCell
    }
    
    
}

extension CountryListViewController: UICollectionViewDelegateFlowLayout {
    
}
