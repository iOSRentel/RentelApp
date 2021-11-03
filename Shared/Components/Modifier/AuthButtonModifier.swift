//
//  AuthButtonModifier.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct AuthButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        
        return content
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .cornerRadius(8)
    }
}
