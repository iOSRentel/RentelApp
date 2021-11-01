//
//  ContentView.swift
//  Shared
//
//  Created by Boris Zinovyev on 26.10.2021.
//https://www.youtube.com/watch?v=gLCF0su8CaM&t=537s
// 10:03
//https://www.youtube.com/watch?v=ElexpjhTKzA

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        if status{
            DashboardView()
        }else{
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
