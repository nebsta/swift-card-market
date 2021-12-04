//
//  UserManager.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

class UserManager : UserManagerProtocol {

    private var network:NetworkProtocol
    private var currentUser:User? = nil
    
    init(_ network:NetworkProtocol) {
        self.network = network
    }
    
    public func login(_ username: String, password: String) async throws {
        let user = try await network.login(username,password)
        self.currentUser = user
    }
    
    func signup(_ form: UserForm) async throws -> Void {
        let user = try await network.signup(form)
        self.currentUser = user
    
    }
    
    public func logout() {
        self.currentUser = nil
    }
    
    
    
}
