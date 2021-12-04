//
//  MainApp.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

@main
struct MainApp: App {
    
    let network:NetworkProtocol
    let userManager:UserManagerProtocol
    
    var body: some Scene {
        WindowGroup {
            TitleView(self.userManager)
        }
    }
    
    init() {
        self.network = DummyNetwork()
        self.userManager = UserManager(self.network)
    }
}
