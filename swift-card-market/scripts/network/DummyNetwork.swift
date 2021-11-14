//
//  DummyNetwork.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation

class DummyNetwork : NetworkProtocol {
    func login(_ username: String, _ password: String) async {
        
    }
    
    func purchaseCard(_ id: String) async {
        
    }
    
    func logout() {
        
    }
    
    func fetchMarketplace() async -> [Card] {
        return [
            Card(id: "id1", title: "Test Card1", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg"),
            
            Card(id: "id2", title: "Test Card2", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg"),
            
            Card(id: "id3", title: "Test Card3", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg")
        ]
    }
}
