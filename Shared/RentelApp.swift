//
//  RentelApp.swift
//  Shared
//
//  Created by Boris Zinovyev on 26.10.2021.
//

import SwiftUI
import Firebase

@main
struct RentelApp: App {
    
    #if os(macOS)
   @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
   #else
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   #endif

    var body: some Scene {
        
        #if os(iOS)
        WindowGroup {
            ContentView()
        }
        #else
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif

    
#if os(macOS)
class AppDelegate: NSObject, NSApplicationDelegate {

    private func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
        
    }
}
#else
class AppDelegate: NSObject, UIApplicationDelegate {
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
}
}
#endif
}
}
        

        
#if !os(iOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif


