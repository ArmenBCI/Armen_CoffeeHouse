//
//  FavoriteCell.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 22.08.23.
//

import SwiftUI

//struct FavoriteCell: View {
//    
//    @StateObject var viewModel: CardViewModel
//    @State private var isTableViewShow: Bool = false
//    let model: Possition
//    
//    var body: some View {
//        HStack {
//            Image(model.product.imageUrl)
//                .frame(width: 150)
//                .padding(6)
//                .background(Color("TextFieldGray"))
//                .cornerRadius(12)
//            
//            VStack(alignment: .leading) {
//                Text(model.product.title)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                
//                Text("200 ml")
//                    .foregroundColor(.gray)
//                
//                Text("\(model.product.price) AMD")
//                    .font(.title3.bold())
//                    .foregroundColor(.white)
//                    .padding(.top, 3)
//                    .padding(.bottom, 10)
//            }
//            
//            Spacer()
//            
//            
//            Button {
//                viewModel.positions.removeAll { pos in
//                    pos.product.id == model.product.id
//                }
//            } label: {
//                Image(systemName: "heart.fill")
//                    .foregroundColor(Color("custRed"))
//                    .font(.title2)
//                    .padding(10)
//                    .background(Color.white)
//                    .cornerRadius(12)
//                    .padding(.bottom, 40)
//            }
//            .sheet(isPresented: self.$isTableViewShow) {
//                ProductDetailView(viewModel: CardViewModel.shared,
//                                  model: Product(id: model.product.id,
//                                                 title: model.product.title,
//                                                 imageUrl: model.product.imageUrl,
//                                                 price: model.product.price,
//                                                 descript: model.product.descript), productViewModel: )
//            }
//        }
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(Color("TextFieldGray").opacity(0.9))
//        .cornerRadius(12)
//        .padding(.horizontal, 2)
//        .onTapGesture {
//            isTableViewShow.toggle()
//        }
//        
//    }
//}
//
//struct FavoriteCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteCell(viewModel: CardViewModel.shared,
//                     model: Possition(id: UUID().uuidString,
//                                      product: Product(id: "2",
//                                                       title: "Esprsso",
//                                                       imageUrl: "Capuchino",
//                                                       price: 1800,
//                                                       descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."),
//                                      count: 1))
//    }
//}
//
