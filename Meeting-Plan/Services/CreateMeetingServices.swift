//
//  SearchResultServices.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation
import Alamofire

protocol CreateMeetingDelegate {
    func requestCreateEvent(keyword: String?, success: @escaping (Data) -> (), failure: @escaping (String) -> ())
}

class CreateMeetingServices: CoreService {
    
}

extension CreateMeetingServices: CreateMeetingDelegate {
    
    func requestCreateEvent(keyword: String?, success: @escaping (Data) -> (), failure: @escaping (String) -> ()) {
        
        var header = HTTPHeaders()
        
        header["Authorization"] = ""
        
        let url = ""
        
        self.callAPI(url: url, method: .get, encode: URLEncoding.default, headers: header, parameter: [:], success: success, failure: failure)
        
    }
}
