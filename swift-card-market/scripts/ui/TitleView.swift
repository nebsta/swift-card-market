//
//  TitleView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
            
                Text("Card Market")
                    .font(.system(size: 50))
                
                Text("You like cards eh?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                
                NavigationLink(destination: MainView()) {
                    Text("Login")
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
