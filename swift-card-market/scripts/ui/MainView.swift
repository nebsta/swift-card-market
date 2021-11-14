//
//  MainView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MarketplaceView()
                .tabItem {
                    Label("Marketplace", systemImage: "list.dash")
                }
            
            MyCollectionView()
                .tabItem {
                    Label("My Collection", systemImage: "list.dash")
                }
            
            MyProfileView()
                .tabItem {
                    Label("My Profile", systemImage: "list.dash")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
