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
    @State var signupInProgress:Bool = false
    
    @State var showingError:Bool = false
    @State var errorMessage:String = ""
    
    public init(_ userManager:UserManagerProtocol?) {
        self.userManager = userManager
    }
    
    var body: some View {
        LoadingView(isShowing: $signupInProgress, text: "Signing Up...")
        {
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
                    
                    Button("Signup") {
                        Task {
                            signupInProgress = true
                            defer { signupInProgress = false }
                            
                            let form:UserForm = UserForm(email, password, passwordConfirm, username)
                            
                            var errorMessage:String? = nil
                            do
                            {
                                try await userManager?.signup(form)
                            }
                            catch SignupError.UsernameLength
                            {
                                let minLength:Int = UserManager.UsernameRange.lowerBound
                                let maxLength:Int = UserManager.UsernameRange.upperBound
                                errorMessage = "Username must be between \(minLength) and \(maxLength) characters long"
                            }
                            catch SignupError.PasswordLength
                            {
                                let minLength:Int = UserManager.PasswordRange.lowerBound
                                let maxLength:Int = UserManager.PasswordRange.upperBound
                                errorMessage = "Password must be between \(minLength) and \(maxLength) characters long"
                            }
                            catch SignupError.MismatchPassword
                            {
                                errorMessage = "Both the password provided do not match"
                            }
                            
                            // show the error
                            if let message:String = errorMessage {
                                self.showingError = true
                                self.errorMessage = message
                            }
                        }
                    }
                }.alert("Signup Error", isPresented: $showingError, actions: { }, message: { Text(errorMessage) })
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(nil)
    }
}
