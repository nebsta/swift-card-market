//
//  LoginForm.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 05/12/2021.
//

import Foundation

struct LoginForm {
    public let username:String
    public let password:String
    
    init(_ username:String, _ password:String) {
        self.username = username
        self.password = password
    }
}
