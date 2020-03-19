//
//  APIResponse.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class which stores data retreived from the Corona API
 */
class APIResponse: Decodable {
    // Part 1B
    struct Conditions: Decodable {
        let error: Bool
        let statusCode: Int
        let message: String
    }
    
    struct Data: Decodable {
        let lastChecked: String
        
        struct Covid19Stats: Decodable {
            let province: String
            let country: String
            let lastUpdate: Date
            let confirmed: Int
            let deaths: Int
            let recovered: Int
        }
        
    }
}
