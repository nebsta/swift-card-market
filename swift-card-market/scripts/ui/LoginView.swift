//
//  LoginView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct LoginView: View {
    
    enum Field : Hashable {
        case Username
        case Password
    }
    
    let userManager:UserManagerProtocol?
    
    @State private var loggingIn:Bool = false
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var loginInProgress:Bool = false
    
    @State private var showingError:Bool = false
    @State private var errorMessage:String = ""
    
    @FocusState private var focusedField: Field?
    
    public init(_ userManager:UserManagerProtocol?) {
        self.userManager = userManager
    }
    
    var body: some View {
        LoadingView(isShowing: $loggingIn, text: "Logging In...")
        {
            VStack
            {
                Text("Login")
                    .font(.system(size: (20)))
                
                Form {
                    
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .Username)
                        .onSubmit { focusedField = .Password }
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .focused($focusedField, equals: .Password)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .onSubmit { Task { await login() } }
                    
                    Button("Login") { Task { await login() } }
                }
            }.alert("Login Error", isPresented: $showingError, actions: { }, message: { Text(errorMessage) })
        }
    }
    
    private func login() async -> Void {
        loginInProgress = true
        defer { loginInProgress = false }
        
        // attempt signup and check for errors
        let form:LoginForm = LoginForm(username, password)
        var errorMessage:String? = nil
        do {
            try await userManager?.login(form)
        }
        catch LoginError.InvalidCredentials {
            errorMessage = "Invalid credentials given"
        }
        catch {
            errorMessage = "An unknown error has occured"
        }
        
        // show the error if there was one
        if let message:String = errorMessage {
            self.showingError = true
            self.errorMessage = message
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(nil)
    }
}
