//
//  CountryAPIClient.swift
//  Collection View Lab
//
//  Created by Jason Ruan on 9/26/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

class CountryAPIClient {
    private init() {}
    static let manager = CountryAPIClient()
    
    private let allCountriesURLString = "https://restcountries.eu/rest/v2"
    
    func getCountries(completionHandler: @escaping (Result<[Country], AppError>) -> () ) {
        guard let url = URL(string: allCountriesURLString) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: nil, andMethod: .get) { (result) in
            switch result {
            case .failure(_):
                completionHandler(.failure(.noDataReceived))
            case .success(let data):
                do {
                    let arrCountries = try JSONDecoder().decode([Country].self, from: data)
                    completionHandler(.success(arrCountries))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
