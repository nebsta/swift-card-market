//
//  TitleView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct TitleView: View {
    
    let userManager:UserManagerProtocol?
    
    public init(_ userManager:UserManagerProtocol?) {
        self.userManager = userManager
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
            
                Text("Card Market")
                    .font(.system(size: 50))
                
                Text("You like cards eh?")
                    .font(.system(size: 12))
                
                NavigationLink(destination: LoginView(self.userManager)) {
                    Text("Login")
                }
                .buttonStyle(.bordered)
                
                NavigationLink(destination: SignupView(self.userManager)) {
                    Text("Signup")
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(nil)
    }
}
