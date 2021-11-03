//
//  AuthScreen.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct AuthScreen: View {
    
        @StateObject var loginData = LoginViewModel()
            
            var body: some View {
                
                HStack(alignment: .bottom, spacing: 0){
                    
                    VStack{
                        
                        HStack{
                            
                            Text("RENTEL\nPoint of Sale")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("FontColor"))
                                .padding(.leading, 25)
                            
                            Spacer()
                        }
                        .padding()
                        
        // Логотип
                        Image("kassa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .padding(.horizontal)
                        
                        
        //      Login Register
                        if !loginData.ismacOS{
                            SideLoginView()
                        }
                    }
                    if loginData.ismacOS{
                        SideLoginView()
                    }
                }
                .frame(maxHeight: .infinity)
                .background((loginData.ismacOS ? nil : Color("BGColor"))
                                .ignoresSafeArea(.all, edges: .all))
                
        //     and eliminated redeclaration
                .environmentObject(loginData)
                
            }
        }

