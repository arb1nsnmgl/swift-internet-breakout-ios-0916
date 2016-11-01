//
//  DarkSkyRepository.swift
//  niftyFlatironWeather
//
//  Created by Arvin San Miguel on 11/1/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class DarkSkyRepository {
    
    var latitude : Double
    var longitude : Double
    var timezone : String
    var offset : Double
    var currently : JSONDictionary
    var hourly : JSONDictionary
    var daily : JSONDictionary
    
    init(dictionary values: JSONDictionary) {
        
        self.latitude = values["latitude"] as! Double
        self.longitude = values["longitude"] as! Double
        self.timezone = values["timezone"] as! String
        self.offset = values["offset"] as! Double
        self.currently = values["currently"] as! JSONDictionary
        self.hourly = values["hourly"] as! JSONDictionary
        self.daily = values["daily"] as! JSONDictionary
    
    }
    
    
}
