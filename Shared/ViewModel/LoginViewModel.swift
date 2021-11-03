//
//  LoginViewModel.swift
//  Rentel
//
//  Created by Boris Zinovyev on 26.10.2021.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {

// Login properties
    @Published var userName = ""
    @Published var password = ""
    
// Register Properties
    @Published var isNewUser = false
    
    @Published var registerUserName = ""
    @Published var registerPassword = ""
    @Published var reEnterPassword = ""
    
// LoadingScreen
    @Published var isLoading = false
    
// Error
    @Published var errorMsg = ""
    @Published var error = false
    
// Log status
    @AppStorage("log_Status") var status = false
    
    
//MARK: - Auth
    func loginUser(){
//   Loading Screen
        withAnimation{isLoading = true}
    
        
//MARK: Login User
        Auth.auth().signIn(withEmail: userName, password: password) { [self] (result, err) in
            if let error = err{
//   Promoting Error
                errorMsg = error.localizedDescription
                self.error.toggle()
                return
            }
            
            guard let _ = result else{
                errorMsg = "Please try again later"
                error.toggle()
                return
            }
            print("Success")
            withAnimation{status = true}
        }
    }
    
//MARK: Reset password
    func resetPassword() {

//Check password
            withAnimation{isLoading = true}
            
            Auth.auth().sendPasswordReset(withEmail: userName) { [self] (err) in
                if let error = err{
    //   Promoting Error
                    errorMsg = error.localizedDescription
                    self.error.toggle()
                    return
                }
                errorMsg = "Reset Link send successfully"
                error.toggle()
            }
        }
        
    //MARK: Regiser User
        func registerUser() {
            if reEnterPassword == registerPassword{
            
            withAnimation{isLoading = true}
                
            Auth.auth().createUser(withEmail: registerUserName, password: reEnterPassword) { [self] (result, err) in
                if let error = err{
    //   Promoting Error
                    errorMsg = error.localizedDescription
                    self.error.toggle()
                    return
                }
                
                guard let _ = result else {
                    errorMsg = "Please try again later"
                    error.toggle()
                    return
                }
    //   Success
                print("Success")
                errorMsg = "Account Crated Successfully"
                error.toggle()
                withAnimation{isNewUser = false}
                
            }
        }
        else{
         errorMsg = "Missing password"
            error.toggle()
        }
    }
}
