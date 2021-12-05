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
    
    public func login(_ form:LoginForm) async throws {
        
        guard UserManager.UsernameRange.contains(form.username.count) &&
              UserManager.PasswordRange.contains(form.password.count) else {
            throw LoginError.InvalidCredentials
        }
        
        self.currentUser = try await network.login(form)
    }
    
    public func signup(_ form: SignupForm) async throws -> Void {
        
        guard form.email.isValidEmail() else {
            throw SignupError.InvalidEmail
        }
        
        guard UserManager.UsernameRange.contains(form.username.count) else {
            throw SignupError.UsernameLength
        }
        
        guard UserManager.PasswordRange.contains(form.password.count) else {
            throw SignupError.PasswordLength
        }
        
        guard form.password == form.passwordConfirm else {
            throw SignupError.MismatchPassword
        }
        
        self.currentUser = try await network.signup(form)
    }
    
    public func logout() {
        self.currentUser = nil
    }
}

enum SignupError : Error {
    case UsernameLength
    case PasswordLength
    case MismatchPassword
    case InvalidEmail
    case UserExists
}

enum LoginError : Error {
    case InvalidCredentials
}
