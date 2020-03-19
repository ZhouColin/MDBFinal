//
//  CoronaData.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/16/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

// Part 1A

protocol CoronaData: Codable {
    var confirmed: Int {get set}
    var deaths: Int {get set}
    var recovered: Int {get set}
    
    var country: String {get set}
    var province: String? {get set}
    
    var name: String {get}
}

struct ProvinceData: CoronaData {
    var confirmed: Int
    var country: String
    var deaths: Int
    var province: String?
    var recovered: Int
    
    var name: String {
        return "\(country)-\(province!)"
    }
}

struct CountryData: CoronaData {
    var confirmed: Int
    var country: String
    var deaths: Int
    var province: String? = nil
    var recovered: Int
    
    var name: String {
        return "\(country)"
    }
    
    var provinces:[ProvinceData] = []
    
    init(withProvince province:ProvinceData) {
        self.confirmed = province.confirmed
        self.deaths = province.deaths
        self.recovered = province.recovered
        self.country = province.country
    }
}
