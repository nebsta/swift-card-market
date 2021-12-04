//
//  DummyNetwork.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import Foundation


class DummyNetwork : NetworkProtocol {
    
    let signupDelaySeconds:UInt64 = 5
    let loginDelaySeconds:UInt64 = 5
    let fetchMarketplaceDelaySeconds:UInt64 = 5
    let purchaseCardDelaySeconds:UInt64 = 5
    
    let signupError:NetworkError? = nil
    let loginError:NetworkError? = nil
    let purchaseError:NetworkError? = nil
    let fetchMarketplaceError:NetworkError? = nil
    
    private func delay(_ seconds: UInt64) async {
        await Task.sleep(loginDelaySeconds * 1_000_000_000)
    }
    
    public func login(_ username: String, _ password: String) async throws -> User {
        await delay(loginDelaySeconds)
        
        if let loginError = loginError {
            throw loginError
        }
        
        return User(id:"some_id", email:"ben.nat.wallis@gmail.com", username: "nebjezus", profileUrl: "https://scontent.faal1-1.fna.fbcdn.net/v/t1.6435-9/119175977_10223082383673232_2069570767405236772_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEBzLJ66IHjt1-Xi-_3N2oL5RG0yXPOZmblEbTJc85mZu-65BHKPaIH1Z6nA20U5aQ&_nc_ohc=bR1hDyjMMaoAX8V96uj&_nc_ht=scontent.faal1-1.fna&oh=62f751056206ed4f4758b365c5c815e4&oe=61B845EE")
    }
    
    func signup(_ form: UserForm) async throws -> User {
        await delay(signupDelaySeconds)
        
        if let signupError = signupError {
            throw signupError
        }
        
        return User(id:"some_id", email:"ben.nat.wallis@gmail.com", username: "nebjezus", profileUrl: "https://scontent.faal1-1.fna.fbcdn.net/v/t1.6435-9/119175977_10223082383673232_2069570767405236772_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEBzLJ66IHjt1-Xi-_3N2oL5RG0yXPOZmblEbTJc85mZu-65BHKPaIH1Z6nA20U5aQ&_nc_ohc=bR1hDyjMMaoAX8V96uj&_nc_ht=scontent.faal1-1.fna&oh=62f751056206ed4f4758b365c5c815e4&oe=61B845EE")
    }
    
    func purchaseCard(_ id: String) async throws {
        await delay(purchaseCardDelaySeconds)
        
        if let purchaseError = purchaseError {
            throw purchaseError
        }
    }
    
    func logout() {
        
    }
    
    func fetchMarketplace() async throws -> [Card] {
        
        await delay(fetchMarketplaceDelaySeconds)
        
        if let fetchMarketplaceError = fetchMarketplaceError {
            throw fetchMarketplaceError
        }
        
        return [
            Card(id: "id1", title: "Test Card1", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg", value: 10.0),
            
            Card(id: "id2", title: "Test Card2", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg", value: 5.0),
            
            Card(id: "id3", title: "Test Card3", descriptin: "Some description", imageUrl: "https://mysticmedusa.com/wp-content/uploads/2019/12/Nine-Of-Diamonds.jpg", value: 3.0)
        ]
    }
}
