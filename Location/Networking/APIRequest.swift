//
//  APIRequest.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation

protocol APIRequest {
    var method : RequestType { get }
    var path : String { get }
    var body : [String : Any] { get }
}
enum RequestType : String {
    case get = "GET"
    case post = "POST"
}

extension APIRequest  {
    func request(with baseURL: URL) -> URLRequest  {
        guard let components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
       
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(getAuthorization(userName: Constants.User.USER_NAME, password: Constants.User.PASSWORD), forHTTPHeaderField: "Authorization")
        return request
        
    }
    func getAuthorization(userName : String, password : String) -> String {
        
        let loginString = String(format: "%@:%@", userName, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        return "Basic \(base64LoginString)"
    }
}
