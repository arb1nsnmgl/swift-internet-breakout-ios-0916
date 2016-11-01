//
//  DarkSkyAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Arvin San Miguel on 11/1/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

typealias JSONDictionary = [ String : AnyObject ]
typealias NetworkResult = ((JSONDictionary) -> Void)


class DarkSkyAPIClient {
    
    class func getRepositories(_ latitude: Double, longitude: Double, with completion: @escaping NetworkResult) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let url = URL(string: "https://api.darksky.net/forecast/\(Secret.clientSecret)/\(latitude),\(longitude)")
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let data = data else { print(error); return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
            
            if let json = json {
                OperationQueue.main.addOperation {
                    completion(json!)
                }
            }
        }
        task.resume()
    }
}
