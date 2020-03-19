//
//  DataModel.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A singleton class which helps store data from the API
 */
class DataModel {
    var countryData: [CountryData]
    
    private var countryDict:[String:CountryData]
    
    static let shared = DataModel()
    
    private init() {
        countryData = []
        countryDict = [:]
    }
    
    func fetchData(completion: (() -> ())?) {
        APIManager.retrieveData(for: nil) { (data) in
            self.countryData = []
            
            for province in data {
                if var country = self.countryDict[province.country] {
                    country.deaths += province.deaths
                    country.recovered += province.recovered
                    country.confirmed += province.confirmed
                    
                    country.provinces.append(province)
                } else {
                    let country = CountryData(withProvince: province)
                    self.countryDict[country.country] = country
                    self.countryData.append(country)
                }
            }
            
            completion?()
        }
    }
}
