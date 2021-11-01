//
//  LoadingScreen.swift
//  Rentel
//
//  Created by Boris Zinovyev on 31.10.2021.
//

import SwiftUI
struct LoadingScreen: View {
    var body: some View {
        
        ZStack {
            Color.white.opacity(0.23)
            
            ProgressView()
                .frame(width: 70, height: 70)
                .background(Color("BGColor"))
                .cornerRadius(10)
//     цвет индикатора
                .colorScheme(.light)
        }
        .ignoresSafeArea()
    }
}
