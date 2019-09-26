//
//  ViewController.swift
//  Collection View Lab
//
//  Created by Jason Ruan on 9/26/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialViewController()
    }
    
    private func configureInitialViewController() {
        countrySearchBar.delegate = self
        countryCollectionView.dataSource = self
        countryCollectionView.delegate = self
    }
    
}

extension ViewController: UISearchBarDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
