//
//  LoginView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct LoginView: View {
    let userManager:UserManagerProtocol?
    
    @State var loggingIn:Bool = false
    @State var email:String = ""
    @State var password:String = ""
    
    public init(_ userManager:UserManagerProtocol?) {
        self.userManager = userManager
    }
    
    var body: some View {
        VStack
        {
            Text("Login")
                .font(.system(size: (20)))
            
            Form {
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                
                Button("Login", action: login)
            }
        }
    }
    
    private func login() -> Void {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(nil)
    }
}
