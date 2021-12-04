//
//  Network.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

protocol NetworkProtocol {
    func fetchMarketplace() async throws -> [Card]
    func purchaseCard(_ id:String) async throws -> Void
    
    func login(_ username:String, _ password:String) async throws -> User
    func signup(_ form:UserForm) async throws -> User
    func logout() -> Void
}

enum NetworkError : Error {
    case Timeout
    case Offline
    case Unauthorised
}
