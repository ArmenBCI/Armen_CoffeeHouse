//
//  CardViewModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 22.08.23.
//

import Foundation

class CardViewModel: ObservableObject {
    
    static let shared = CardViewModel()
    
    private init() { }
    
    @Published var positions = [Possition]()
    

    var cost: Int {
        
        var sum = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    func addPositions(_ possition: Possition) {
        self.positions.append(possition)
    }
    
}
