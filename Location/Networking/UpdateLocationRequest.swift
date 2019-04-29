//
//  UpdateLocationRequest.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
class UpdateLocationRequest : APIRequest {
    
    var method =  RequestType.post
    var path = String()
    var body = [String : Any]()
    
    init(body : [String : Any]) {
        self.path = "client/\(Constants.User.CLIENT_ID)/user/\(Constants.User.USER_ID)/location"
        self.body = body
    }
    
}
