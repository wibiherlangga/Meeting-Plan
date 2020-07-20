//
//  NetworkDelegate.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkDelegate {
    
    func callAPI(url: String,
                 method: HTTPMethod?,
                 encode: ParameterEncoding?,
                 headers: HTTPHeaders?,
                 parameter: [String: Any],
                 success: @escaping (_ response: Data)->(),
                 failure: @escaping (_ error: String)->())    
}

