//
//  CustomTextField.swift
//  Rentel
//
//  Created by Boris Zinovyev on 31.10.2021.
//

import SwiftUI
struct CustomTextField: View {
    @Binding var value: String
    var hint: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Text(hint)
                .font(.caption)
                .foregroundColor(.gray)
            
            ZStack{
                if hint == "User Name"{
                    TextField(hint == "User Name" ? "company@email.com" : "**********", text: $value)
                }
                else{
                    SecureField("**********", text: $value)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("FontColor").opacity(0.1))
            .cornerRadius(8)
            .colorScheme(.dark)
        })
    }
}
