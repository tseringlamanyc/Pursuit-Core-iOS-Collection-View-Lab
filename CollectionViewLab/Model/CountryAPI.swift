//
//  CountryAPI.swift
//  CollectionViewLab
//
//  Created by Tsering Lama on 1/14/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation
import NetworkHelper

struct CountryAPI {
    static func getCountry(countrySearch: String, completionHandler: @escaping (Result<[Countries], AppError>) -> ()) {
        let endpointURL = "https://restcountries.eu/rest/v2/name/\(countrySearch)"
        guard let url = URL(string: endpointURL) else {
            completionHandler(.failure(.badURL(endpointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let countryData = try JSONDecoder().decode([Countries].self, from: data)
                    completionHandler(.success(countryData))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
