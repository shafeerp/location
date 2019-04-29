//
//  Defaults.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
import CoreLocation

struct Defaults {
        
    static func setUpdatedLocation(updatedLocation : CLLocation) {
        let locationData = NSKeyedArchiver.archivedData(withRootObject: updatedLocation)
        UserDefaults.standard.set(locationData, forKey: Constants.Defaults.LOCATION_KEY)
    }
    
    static func getUpdatedLocation() -> CLLocation? {
        if let locationData =  UserDefaults.standard.data(forKey: Constants.Defaults.LOCATION_KEY){
            if let updatedLocation = NSKeyedUnarchiver.unarchiveObject(with: locationData) as? CLLocation {
                return updatedLocation
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
        
    }
    
}



