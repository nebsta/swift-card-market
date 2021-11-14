//
//  Network.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

protocol NetworkProtocol {
    func fetchMarketplace() async -> [Card]
    func purchaseCard(_ id:String) async -> Void
    
    func login(_ username:String, _ password:String) async -> Void
    func logout() -> Void
}
