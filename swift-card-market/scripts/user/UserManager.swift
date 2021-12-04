//
//  UserManager.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

class UserManager : UserManagerProtocol {
    public static let PasswordRange:ClosedRange<Int> = 8...20
    public static let UsernameRange:ClosedRange<Int> = 8...20

    private var network:NetworkProtocol
    private var currentUser:User? = nil
    
    init(_ network:NetworkProtocol) {
        self.network = network
    }
    
    public func login(_ username: String, password: String) async throws {
        let user = try await network.login(username,password)
        self.currentUser = user
    }
    
    public func signup(_ form: UserForm) async throws -> Void {
        
        guard UserManager.UsernameRange.contains(form.username.count) else {
            throw SignupError.UsernameLength
        }
        
        guard UserManager.PasswordRange.contains(form.password.count) else {
            throw SignupError.PasswordLength
        }
        
        guard form.password == form.passwordConfirm else {
            throw SignupError.MismatchPassword
        }
        
        do {
            let user = try await network.signup(form)
            self.currentUser = user
        }
        catch NetworkError.Offline {
            
        }
        catch NetworkError.BadRequest {
            
        }
    }
    
    public func logout() {
        self.currentUser = nil
    }
}

enum SignupError : Error {
    case UsernameLength
    case PasswordLength
    case MismatchPassword
    case UserExists
}

enum LoginError : Error {
    case InvalidCredentials
}
