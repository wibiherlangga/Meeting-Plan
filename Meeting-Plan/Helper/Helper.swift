//
//  Helper.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 20/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

class Helper {
    
    static func showAlert(message: String, vc: UIViewController) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let oke = UIAlertAction(title: "OKE", style: .default, handler: nil)
        alert.addAction(oke)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
}
