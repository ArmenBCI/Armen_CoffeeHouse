//
//  CardCell.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 20.08.23.
//

import SwiftUI

struct CardCell: View {
    
    @StateObject var viewModel: CardViewModel
    @State private var coffeeCount: Int = 1
    
    let model: Possition
    
    var body: some View {
        HStack {
            Image(model.product.imageUrl)
                .frame(width: 150)
                .padding(6)
                .background(Color("TextFieldGray"))
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(model.product.title)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                //                Text("180 ml")
                //                    .foregroundColor(.gray)
                //                    .padding(.bottom, 20)
                
                Text("\(model.count) հատ")
                    .font(.system(size: 16).bold())
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .padding(.top, 2)
                
                Text("\(model.product.price) AMD")
                    .font(.system(size: 15).bold())
                    .foregroundColor(.white)
                
                
            }
            
            Spacer()
            
            
            VStack(alignment: .leading) {
                Button {
                    viewModel.positions.removeAll { pos in
                        pos.product.id == model.product.id
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("custRed"))
                        .font(.title2.bold())
                        .padding(22)
                        .background(Color("TextFieldGray"))
                        .cornerRadius(12)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("TextFieldGray").opacity(0.9))
        .cornerRadius(12)
        .padding(.horizontal, 2)
    }
}

struct CardCell_Previews: PreviewProvider {
    static var previews: some View {
        CardCell(viewModel: CardViewModel.shared,
                 model: Possition(id: UUID().uuidString,
                                  product: Product(id: "2",
                                                   title: "Esprsso",
                                                   imageUrl: "Capuchino",
                                                   price: 1800,
                                                   descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."),
                                  count: 1))
    }
}
