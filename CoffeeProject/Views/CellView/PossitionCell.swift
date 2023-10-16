//
//  PossitionCell.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 30.08.23.
//

import SwiftUI

struct PossitionCell: View {
    
    let position: Possition
    
    var body: some View {
        HStack {
            Text(position.product.title)
            Spacer()
//                .fontWeight(.bold)
            Text("\(position.count) հատ")
            Spacer()
            Text("\(position.cost)AMD")
                .fontWeight(.bold)
        }
    }
}

struct PossitionCell_Previews: PreviewProvider {
    static var previews: some View {
        PossitionCell(position: Possition(id: UUID().uuidString,
                                          product: Product(id: UUID().uuidString,
                                                           title: "Capuchino",
                                                           imageUrl: "Capuchino",
                                                           price: 1800, descript: "ivbnuriubnoinbot4"),
                                          count: 1))
    }
}
