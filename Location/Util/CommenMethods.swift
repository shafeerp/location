//
//  CommenMethods.swift
//  Location
//
//  Created by Shafeer Puthalan on 29/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import Foundation
import UIKit

struct CommonMethods {
    
    public static func showAlert(title : String, message:String, view : UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}
