//
//  SignupView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct SignupView: View {
    let userManager:UserManagerProtocol?

    
    @State var email:String = ""
    @State var username:String = ""
    @State var password:String = ""
    @State var passwordConfirm:String = ""
    
    public init(_ userManager:UserManagerProtocol?) {
        self.userManager = userManager
    }
    
    var body: some View {
        VStack
        {
            Text("Signup")
                .font(.system(size: (20)))
            
            Form {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                TextField("Username", text: $username)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password (Confirm)", text: $passwordConfirm)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                
                Button("Signup", action: signup)
            }
        }
    }
    
    private func signup() {
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(nil)
    }
}
