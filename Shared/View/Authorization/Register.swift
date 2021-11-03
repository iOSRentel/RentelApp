//
//  Register.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct Register: View {
    @EnvironmentObject var loginData : LoginViewModel
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 18, content: {
            
            Label(
                title: {
                    Text("Please Register")
                        .font(.title2)
                        .fontWeight(.bold)
                    .foregroundColor(Color("FontColor")) },
                
                
                icon: {
                    // Back button
                    Button(action: {
                        //крутилка
                        withAnimation{
                            loginData.goToRegister.toggle()
                        }
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("FontColor"))
                            .rotationEffect(.init(degrees: 180))
                    })
//      для Мак
                    .buttonStyle(PlainButtonStyle())
                    
                })
                    
                    Label(
                        title: { TextField("Enter Email", text: $loginData.userName)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                        }, icon: { Image(systemName: "envelope")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    Label(
                        title: { TextField("Password", text: $loginData.password)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                            
                        }, icon: { Image(systemName: "lock")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    Label(
                        title: { TextField("Re-Enter Password", text: $loginData.reEnterPassword)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                        },
                        icon: { Image(systemName: "lock")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    Divider()
                })
                .modifier(LoginViewModifier())
        }
    }
