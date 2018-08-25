//
//  AWSUserDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class AWSUserDAO: UserDAO {
    
    var user: User!
    
    func signUp(email: String, password: String, group: String, callback: @escaping (Bool) -> Void) {
        let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/user/register"
        let params = ["email": email, "password": password, "group": group]
        API.http.post(url: baseUrl, params: params) { (data) in
            print("data: " + data!)
            if let json = JsonUtil.stringToJson(string: data), let success = json["success"].bool, success{
                callback(true)
            }else{
                callback(false)
            }
        }
    }
    
    func signIn(email: String, password: String, callback: @escaping (User?) -> Void) {
        let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/user/login"
        let params = ["email": email, "password": password]
        API.http.post(url: baseUrl, params: params) { (data) in
            if let json = JsonUtil.stringToJson(string: data){
                let user = User(json: json)
                self.user = user
                callback(user)
            }else{
                callback(nil)
            }
        }
    }
    
    func me(callback: @escaping (User?)->Void){
        callback(user)
    }
    
    func logout(callback: @escaping (Bool)->Void){
        user = nil
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        callback(user == nil)
    }
    
}
