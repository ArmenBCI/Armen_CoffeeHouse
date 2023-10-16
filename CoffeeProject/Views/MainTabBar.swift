//
//  MainTabBar.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 17.08.23.
//

import SwiftUI

struct MainTabBar: View {
    
    @State private var selectedTab: Tab = .house
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .house:
                    CatalogView(model: Product(id: "1",
                                               title: "Capuchino",
                                               imageUrl: "Capuchino",
                                               price: 1800,
                                               descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."))
                case .map:
                    LocationView()
                case .cart:
                    CartView(viewModel: CardViewModel.shared)
//                case .gearshape:
//                    Text("gear")
                    
                case .person:
                    ProfileView(viewModel: ProfileViewModel(profile: YBUser(id: "",
                                                                            name: "",
                                                                            phone: 00000000,
                                                                            adress: "")))
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: self.$selectedTab)
            }
        }
        .background(Color.black)
        .environment(\.colorScheme, .dark)
    }
}

