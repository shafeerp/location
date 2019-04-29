//
//  APIClient.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
class APIClient {
    
    private let baseURL = URL(string: Constants.Networking.BASE_URL)!
    
    func send(apiRequest : APIRequest,completion: @escaping (_ isSuccess: Bool?, _ error: Error? ) -> Void) {
        let request = apiRequest.request(with: self.baseURL)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(nil,error)
                return
            }
            completion(true, nil)
            return
        }
        task.resume()
        
        
    }
}
