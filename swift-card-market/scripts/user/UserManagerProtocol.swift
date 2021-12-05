//
//  UserManagerProtocol.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

protocol UserManagerProtocol {
    func login(_ form:LoginForm) async throws -> Void
    func signup(_ form:SignupForm) async throws -> Void
    func logout() -> Void
}
