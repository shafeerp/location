//
//  Extensions.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension CALayer {
    func addBorder(cornerRadius : CGFloat, borderWidth : CGFloat, borderColor : CGColor) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}
extension Encodable {
    var jsonObject : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
extension TimeInterval {
    
    func mintutes() -> Int {
        let time = Int(self)
        let min = (time/60) % 60
        return min
    }
}



