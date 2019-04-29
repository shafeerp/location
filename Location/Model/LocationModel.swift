//
//  Location.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation

struct LocationModel : Codable {
    var location :Location
}

struct Location : Codable {
    var lat : Double
    var lng : Double
}
