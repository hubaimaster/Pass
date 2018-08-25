//
//  Network.swift
//  Wordonly
//
//  Created by 김창환 on 2018. 5. 22..
//  Copyright © 2018년 Dobermann I&T. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetwork: Network {
    
    func appendSessionId(params: [String: Any])->[String: Any]{
        return params
    }
    
    func request(url: String, method: HTTPMethod, params: [String: Any], callback: @escaping (String?)->Void){
        let params = appendSessionId(params: params)
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).response { (response) in
            if let data = response.data, let string = String(data: data, encoding: String.Encoding.utf8){
                callback(string)
            }else{
                callback(nil)
            }
        }
    }
    
    func get(url: String, params: [String: Any], callback: @escaping (String?)->Void){
        //request(url: url, method: .get, params: params, callback: callback)
        let params = appendSessionId(params: params)
        var url = url + "?"
        for (idx, param) in params.enumerated(){
            url += param.key + "=\(param.value)"
            if idx != params.count - 1{
                url += "&"
            }
        }
        print("url:\(url)")
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).response { (response) in
            if let data = response.data, let string = String(data: data, encoding: String.Encoding.utf8){
                callback(string)
            }else{
                callback(nil)
            }
        }
    }
    
    func post(url: String, params: [String: Any], callback: @escaping (String?)->Void){
        request(url: url, method: .post, params: params, callback: callback)
    }
    
    func delete(url: String, params: [String: Any], callback: @escaping (String?)->Void){
        request(url: url, method: .delete, params: params, callback: callback)
    }
    
    func patch(url: String, params: [String: Any], callback: @escaping (String?)->Void){
        request(url: url, method: .patch, params: params, callback: callback)
    }
    
    func put(url: String, params: [String: Any], callback: @escaping (String?)->Void){
        request(url: url, method: .put, params: params, callback: callback)
    }
    
}
