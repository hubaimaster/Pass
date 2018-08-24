//
//  AWSUserDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

class AWSUserDAO: UserDAO {
    
    
    func signUp(email: String, password: String, group: String, callback: (Bool) -> Void) {
        let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/user/register"
        let params = ["email": email, "password": password, "group": group]
        API.http.post(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
    func signIn(email: String, password: String, callback: (Bool) -> Void) {
        let baseUrl = "http://ec2-13-125-93-119.ap-northeast-2.compute.amazonaws.com:3000/user/login"
        let params = ["email": email, "password": password]
        API.http.post(url: baseUrl, params: params) { (data) in
            print(data)
            if let data = data{
                
            }else{
                
            }
        }
    }
    
}
