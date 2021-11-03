//
//  DashboardView.swift
//  Rentel
//
//  Created by Boris Zinovyev on 27.10.2021.
//

import SwiftUI
import Firebase


struct DashboardView: View {
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Logged Successfully")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button(action: {
// LogOut function
                try? Auth.auth().signOut()
                withAnimation{status = false}
            }, label: {
                Text("Log Out")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("FontColor"))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(Color.orange)
                    .cornerRadius(8)
            })
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: getRect().width / 1.6, height: getRect().height / 1.6)
    }
}
