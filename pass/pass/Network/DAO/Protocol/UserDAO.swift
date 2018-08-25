//
//  UserDAO.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation

protocol UserDAO {
    func signUp(email: String, password: String, group: String, callback: @escaping (Bool)->Void)
    func signIn(email: String, password: String, callback: @escaping (User?)->Void)
    func charge(email: String, amount: Int) -> Void
    func me(callback: @escaping (User?)->Void)
    func logout(callback: @escaping (Bool)->Void)
}
