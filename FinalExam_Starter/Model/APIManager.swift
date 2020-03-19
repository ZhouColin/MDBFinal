//
//  APIManager.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class containing static methods to make API calls
 */
class APIManager {
    static let BASE_STRING = URL(string: "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats/")!
    static let apiKey = "d4ecb45bb4msh617b4f2e13cf4dap1b87e4jsnfc3d2c9c3e3d"
    
    static var authenticatedBaseUrl: URL {
        return BASE_STRING.appendingPathComponent(apiKey)
    }
    /**
     A static method which makes an API call to retrieve data from the API. It passes this data
     to the caller via the provided completion method.
     */
    static func retrieveData(for country: String?, completion: @escaping ([ProvinceData]) -> ()) {
        var request = URLRequest(url: URL(string: "covid-19-coronavirus-statistics.p.rapidapi.com")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            guard let request = try? JSONDecoder().decode(CoronaData.self, from: data) else {
                return
            }
            
            completion(request.memes)
        }
        
        task.resume()
    }
}
