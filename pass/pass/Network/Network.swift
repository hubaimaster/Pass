//
//  Network.swift
//  Wordonly
//
//  Created by Chang Hwan Kim on 2018. 5. 23..
//  Copyright © 2018년 Dobermann I&T. All rights reserved.
//

import Foundation

protocol Network {
    func get(url: String, params: [String: Any], callback: @escaping (String?)->Void)
    func post(url: String, params: [String: Any], callback: @escaping (String?)->Void)
    func delete(url: String, params: [String: Any], callback: @escaping (String?)->Void)
    func patch(url: String, params: [String: Any], callback: @escaping (String?)->Void)
    func put(url: String, params: [String: Any], callback: @escaping (String?)->Void)
}
