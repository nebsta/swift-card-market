//
//  UserForm.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

struct SignupForm {
    public let email:String
    public let password:String
    public let passwordConfirm:String
    public let username:String
    
    init(_ email:String, _ password:String, _ passwordConfirm:String, _ username:String) {
        self.email = email
        self.password = password
        self.passwordConfirm = passwordConfirm
        self.username = username
    }
}
