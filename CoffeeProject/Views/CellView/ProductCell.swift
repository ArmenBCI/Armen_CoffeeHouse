//
//  ProductCell.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 17.08.23.
//

import SwiftUI

struct ProductCell: View {
    
    @State private var isTableViewShow: Bool = false
    var model: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.imageUrl)
                .padding(18)
                .padding(.horizontal, 13)
                .background(Color("TextFieldGray"))
                .cornerRadius(20)
            
            Text("\(model.title)")
                .font(.system(size: 17).bold())
                .lineLimit(5)
//                .font(.title3)
                .lineLimit(3)
                .padding(.leading, 5)
                .foregroundColor(.white)
            
//            Text("180 ml")
////                .padding(.top, 0.2)
//                .font(.system(size: 16))
//                .padding(.leading, 5)
//                .foregroundColor(.gray.opacity(0.75))
            
            Text("\(model.price) AMD")
                .font(.title3)
                .padding(.leading, 5)
                .padding(.top, 10)
                .foregroundColor(.white)
                .sheet(isPresented: self.$isTableViewShow) {
                    ProductDetailView(viewMod: ProfileViewModel(profile: YBUser(id: "",
                                                                                name: "",
                                                                                phone: 0,
                                                                                adress: "")), viewModel: CardViewModel.shared,
                                      
                                      productViewModel: ProductDetailViewModel(product: Product(id: model.id,
                                                                                                title: model.title,
                                                                                                imageUrl: model.imageUrl,
                                                                                                price: model.price,
                                                                                                descript: model.descript)),
                                      
                                      model: Product(id: model.id,
                                                                                                   title: model.title,
                                                                                                   imageUrl: model.imageUrl,
                                                                                                   price: model.price,
                                                                                                   descript: model.descript))
                }
        }
        .frame(maxHeight: 270)
        .padding(17)
        .background(Color("TextFieldGray").opacity(0.9))
        .cornerRadius(15)
        .padding(.top, 10)
        .onTapGesture {
            isTableViewShow.toggle()
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(model:
                        Product(id: "6",
                                title: "Աղի Մատչա Լատտե",
                                imageUrl: "americano-376x_",
                                price: 1800,
                                descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."))
    }
}
