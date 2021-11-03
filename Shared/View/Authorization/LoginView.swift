//
//  LoginView.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginData : LoginViewModel

    var body: some View {

        VStack(alignment: .leading, spacing: 18, content: {
        
            Text("Please Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("FontColor"))
            Label(
                title: { TextField("Enter Email", text: $loginData.userName)
//      для Мак
                .textFieldStyle(PlainTextFieldStyle())
                },

                
                icon: { Image(systemName: "envelope")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            Divider()
            Label(
                title: { TextField("Password", text: $loginData.password)
//      для Мак
                .textFieldStyle(PlainTextFieldStyle())},
                icon: { Image(systemName: "lock")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Divider()
            
            HStack{
                Button(action: {}, label: {
                    Text("Forgot details?")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
// Going to register page
                    withAnimation{
                        loginData.goToRegister.toggle()}
                }, label: {
                    Text("Create account")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
//           or
                Text("or")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                
//          Sign with Apple button
                Button(action: {}, label: {
                    Text("Sign in with Apple")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("FontColor2"))
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color("AppleColor"))
                        .cornerRadius(8)
                })
                
            }
            .foregroundColor(Color("FontColor"))
            
        })
            .modifier(LoginViewModifier())
    }
}
