//
//  Login.swift
//  Rentel
//
//  Created by Boris Zinovyev on 26.10.2021.
//

import SwiftUI
struct Login: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {

        let width = getRect().width / 1.6
        
        HStack(spacing: 0){
            
            VStack(alignment: .leading, spacing: 18, content: {
                                
//      Заголовок
            Text("RENTEL \nPoint of Sale")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("FontColor"))
                
//MARK: Авторизация
                if !loginData.isNewUser{
                    //      CustomTextField
                                    CustomTextField(value: $loginData.userName, hint: "User Name")
                                    CustomTextField(value: $loginData.password, hint: "Password")
                
                    // Forget password button
                                    Button(action: loginData.resetPassword, label:{
                                        Text("Forget Password?")
                                            .font(.caption)
                                            .foregroundColor(Color("FontColor"))
                                            .fontWeight(.semibold)
                                    })
                                    .disabled(loginData.userName == "")
                                    .opacity(loginData.userName == "" ? 0.8 : 1)
                            
                    // Sign In button
                                    Button(action: loginData.loginUser, label: {
                                        Text("Login")
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.white)
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.orange)
                                            .cornerRadius(8)
                                    })
                                        .padding(.top, 10)
                    //        disable when no data
                                        .disabled(loginData.userName == "" || loginData.password == "")
                                        .opacity((loginData.userName == "" || loginData.password == "") ? 0.6 : 1)

                    // Create Account button
                                    Button(action: {
                    //              Register New User
                                        withAnimation{loginData.isNewUser.toggle()}
                                           }, label: {
                                        Text("Sign Up")
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("FontColor"))
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color("FontColor").opacity(0.1))
                                            .cornerRadius(8)
                                    
                                    })
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
                
                else {
                    
                    // Back Button
                    Button(action: {
                        withAnimation{loginData.isNewUser.toggle()}
                    }, label: {
                        Label(
                            title: { Text("Back")
                                    .fontWeight(.semibold)
                            },
                            icon: {Image(systemName: "chevron.left") })
                            .font(.caption)
                            .foregroundColor(Color("FontColor"))
                    })
                        
                    //      CustomTextField
                    CustomTextField(value: $loginData.registerUserName, hint: "User Name")
                    CustomTextField(value: $loginData.registerPassword, hint: "Password")
                    CustomTextField(value: $loginData.reEnterPassword, hint: "Re-Enter Password")

                            
                    // Sign In button
                                    Button(action: loginData.registerUser, label: {
                                        Text("Sign Up")
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.white)
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.orange)
                                            .cornerRadius(8)
                                    })
                                        .padding(.top, 10)
                    //        disable when no data
                                        .disabled(loginData.registerUserName == "" || loginData.registerPassword == "" || loginData.reEnterPassword == "")
                                        .opacity((loginData.registerUserName == "" || loginData.registerPassword == "" || loginData.reEnterPassword == "") ? 0.6 : 1)
                }
            })
            
                .textFieldStyle(PlainTextFieldStyle())
                .buttonStyle(PlainButtonStyle())
                .padding()
                .padding(.horizontal)
                .offset(y: -50)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color("FontColor"))
                .zIndex(1)

            
//MARK:  Image
            Image("kassa")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width / 1.6)
                .clipped()
                .ignoresSafeArea()
            
        }
        .ignoresSafeArea()
        .overlay(ZStack{if loginData.isLoading{LoadingScreen()}})
        .frame(width: width, height: getRect().height - 180)
//        .background(Color("BGColor"))
//     Error
        .alert(isPresented: $loginData.error, content: {
            Alert(title: Text("Message"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("Ok"),
                action: {
                withAnimation{loginData.isLoading = false}

            }))
        })

    }
    
}

// Extending View to get Screen Rect
extension View {
    func getRect()->CGRect{
        #if os(macOS)
        return NSScreen.main!.visibleFrame
        #else
        return UIScreen.main.bounds
        #endif
    }
}
