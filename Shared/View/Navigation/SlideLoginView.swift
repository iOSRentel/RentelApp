//
//  SlideLoginView.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct SideLoginView: View {
    @EnvironmentObject var loginData: LoginViewModel
    
    var body: some View {
        //  Login / register
                    ZStack {
                        if loginData.goToRegister{
                            Register()
                                .transition(loginData.ismacOS ? .identity : .scale)

                        }
                        else{
                            LoginView()
//    scaling problems with Mac
                                .transition(loginData.ismacOS ? .identity : .scale)
                        }
                    }
                    .overlay(
                        Button(action: {}, label: {
                            Image(systemName: "arrowshape.turn.up.right")
                                .renderingMode(.template)
                                .resizable()
//                                .modifier(LoginButtonModifier())
                        })
// For MacOS
                        .buttonStyle(PlainButtonStyle())
                        
                        .offset(x: -65)
                        ,alignment: .bottomTrailing
            )
    }
}
