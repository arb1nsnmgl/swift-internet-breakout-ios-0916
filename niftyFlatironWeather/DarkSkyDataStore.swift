//
//  DarkSkyDataStore.swift
//  niftyFlatironWeather
//
//  Created by Arvin San Miguel on 11/1/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class DarkSkyDataStore {
    
    static let sharedInstance = DarkSkyDataStore()
    var repositories = [DarkSkyRepository]()
    var latitude = Double()
    var longitude = Double()
    
    private init() {}
    
    
    func getRepositoriesFromDarkSky(_ completion: @escaping () -> ()) {
        
        DarkSkyAPIClient.getRepositories(latitude, longitude: longitude, with: { json in
            
            OperationQueue.main.addOperation {
                self.repositories.append(DarkSkyRepository(dictionary: json))
                print(json)
                completion()
            }
        })
    }
    
}
