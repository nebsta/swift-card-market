//
//  SignupView.swift
//  swift-card-market
//
//  Created by Benjamin Wallis on 14/11/2021.
//

import SwiftUI

struct SignupView: View {
    
    enum Field : Hashable {
        case Email
        case Username
        case Password
        case PasswordConfirm
    }
    
    let userManager:UserManagerProtocol?

    // user signup form states
    @State private var email:String = ""
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var passwordConfirm:String = ""
    @State private var signupInProgress:Bool = false
    @FocusState private var focusedField: Field?
    
    // error states
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
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .Email)
                        .onSubmit { focusedField = .Username }
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
                        .onSubmit { focusedField = .PasswordConfirm }
                    SecureField("Password (Confirm)", text: $passwordConfirm)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .focused($focusedField, equals: .PasswordConfirm)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .onSubmit { Task { await signup() } }
                    
                    Button("Signup") { Task { await signup() } }
                }.alert("Signup Error", isPresented: $showingError, actions: { }, message: { Text(errorMessage) })
            }
        }
    }
    
    private func signup() async -> Void {
        
        // show/hide the loading overlay during signup
        signupInProgress = true
        defer { signupInProgress = false }
        
        // attempt signup and check for errors
        let form:SignupForm = SignupForm(email, password, passwordConfirm, username)
        var errorMessage:String? = nil
        do {
            try await userManager?.signup(form)
        }
        catch SignupError.UsernameLength {
            let minLength:Int = UserManager.UsernameRange.lowerBound
            let maxLength:Int = UserManager.UsernameRange.upperBound
            errorMessage = "Username must be between \(minLength) and \(maxLength) characters long"
        }
        catch SignupError.PasswordLength {
            let minLength:Int = UserManager.PasswordRange.lowerBound
            let maxLength:Int = UserManager.PasswordRange.upperBound
            errorMessage = "Password must be between \(minLength) and \(maxLength) characters long"
        }
        catch SignupError.MismatchPassword {
            errorMessage = "Both the password provided do not match"
        }
        catch SignupError.InvalidEmail {
            errorMessage = "The email provide is not in a valid format"
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(nil)
    }
}
