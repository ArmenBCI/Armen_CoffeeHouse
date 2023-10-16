//
//  MainTabBarViewModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user 
    }
}
