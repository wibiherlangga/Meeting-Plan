//
//  CoreService.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Alamofire

class CoreService: NetworkDelegate {
    
    func callAPI(url: String, method: HTTPMethod?, encode: ParameterEncoding?, headers: HTTPHeaders?, parameter: [String : Any], success: @escaping (Data) -> (), failure: @escaping (String) -> ()) {
        
        let baseURL = ""
        
        Alamofire.request(baseURL, method: method ?? .post, parameters : parameter, encoding: encode ?? JSONEncoding.default, headers: headers ?? HTTPHeaders()).responseJSON { response in
            
            print("URL Request >>> \(String(describing: response.request))")  // original URL request
            print("statusCode >>> \(String(describing: response.response?.statusCode))\n\n")
            do{
                if let responseValue = response.result.value, !(responseValue is NSNull) {
                    let jsonData = try JSONSerialization.data(withJSONObject: responseValue, options: [])
                    let responseString = String(data: jsonData, encoding: .utf8)!
                    print("Param >>> \(parameter)")
                    print("Response >>> \(responseString)\n\n")
                }
                
            } catch  {
                
            }
            
            if self.isConnectedToInternet() {
                
                let statusCode = response.response?.statusCode
                switch (statusCode) {
                case 200,201:
                    guard let data = response.data else { return }
                    success(data)
                case 400,401:
                    failure("ErrorResponse.tokenExpired.rawValue")
                default:
                    print("error for \(baseURL)")
                    failure("Failed to process")
                    
                }
            } else {
                // Handle if lose connection
            }
        }
    }
    
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
