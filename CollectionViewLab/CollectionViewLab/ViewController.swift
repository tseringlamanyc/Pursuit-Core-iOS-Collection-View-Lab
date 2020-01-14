//
//  ViewController.swift
//  CollectionViewLab
//
//  Created by Tsering Lama on 1/14/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchCountry: UISearchBar!
    @IBOutlet weak var countryCV: UICollectionView!
    
    var country = [Countries]() {
        didSet {
            DispatchQueue.main.async {
                self.countryCV.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryCV.dataSource = self
        searchCountry.delegate = self
        loadCountry(userSearch: currentSearch)
    }
    
    var currentSearch = "nepal" {
        didSet {
            CountryAPI.getCountry(countrySearch: currentSearch.lowercased()) { (result) in
                switch result {
                case .failure(let appError):
                    print("\(appError)")
                case .success(let data):
                    self.country = data
                }
            }
        }
    }
    
    func loadCountry(userSearch: String) {
        CountryAPI.getCountry(countrySearch: userSearch) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                self.country = data
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return country.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError()
        }
        let aCountry = country[indexPath.row]
        cell.loadCell(country: aCountry)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interspacing = CGFloat(5)
        let maxwidth = UIScreen.main.bounds.size.width
        let numOfItems = CGFloat(3)
        let totalSpacing = CGFloat(numOfItems * interspacing)
        let itemWidth = CGFloat((maxwidth - totalSpacing) / (numOfItems) )
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearch = searchBar.text!
    }
}

