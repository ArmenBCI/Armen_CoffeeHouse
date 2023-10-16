//
//  CoffeeProjectApp.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 16.08.23.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct CoffeeProjectApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let user = AuthServise.shared.currentUser {
                if user.uid == "6HAl9SjLwARo4DUMN6YUAGkZdOc2" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                        .environmentObject(vm)
                }
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            return true
        }
        
    }
    
}
