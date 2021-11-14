//
//  MainView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
            
                Text("Card Market")
                    .font(.system(size: 50))
                
                Text("You like cards eh?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                
                Button("Login", action: login)
                    .buttonStyle(.bordered)
            }
        }
    }
    
    func login() -> Void {
        print("Test")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
