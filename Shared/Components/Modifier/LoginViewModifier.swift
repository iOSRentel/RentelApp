//
//  LoginViewModifier.swift
//  Rentel
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI

struct LoginViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {

    return content
            .padding()
            .padding(.bottom)
            .background(Color("BGColor"))
            .padding(.vertical)
            .padding(.bottom,10)
            .padding(.horizontal,25)
    }
}
