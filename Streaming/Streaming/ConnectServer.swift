//
//  ConnectServer.swift
//  Streaming
//
//  Created by Dkbmc Developer on 2017. 10. 15..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import Foundation
import Alamofire

// 맥 -> 네트워크 -> ip 주소
private let server = "http://172.30.23.45:3000"

class ConnectServer{
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]){
        url = server + path
        self.method = method
        self.parameters = parameters
    }
    
    // encoding 관련 문제 해결 한글이 Uc57c or Ubcfc 등으로 깨짐
    func request(success: @escaping(_ data: Any)-> Void, fail: @escaping(_ error: Error?)-> Void){
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                print(response.result.value!)
                success(response.result.value as Any)
            }else{
                fail(response.result.error)
            }
        }
    }
}
