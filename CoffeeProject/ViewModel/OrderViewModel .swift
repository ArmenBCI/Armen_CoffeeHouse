//
//  OrderViewModel .swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 30.08.23.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = YBUser(id: "", name: "", phone: 0, adress: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DataBaseService.shared.getProfile(by: order.userID) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
