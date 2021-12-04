//
//  UserManagerProtocol.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

protocol UserManagerProtocol {
    func login(_ username:String, password:String) async throws -> Void
    func signup(_ form:UserForm) async throws -> Void
    func logout() -> Void
}
