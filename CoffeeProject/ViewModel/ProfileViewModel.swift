//
//  ProfileViewModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: YBUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: YBUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DataBaseService.shared.getOrders(by: AuthServise.shared.currentUser!.uid) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                print("Всего заказов: \(orders.count)")
                for (index, order) in self.orders.enumerated() {
                    DataBaseService.shared.getPossitions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func setProfile() {
        DataBaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
